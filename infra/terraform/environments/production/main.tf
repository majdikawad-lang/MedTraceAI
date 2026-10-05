
terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {
    bucket = "medtrace-prod-terraform-state"
    key = "prod/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
provider "aws" { region = var.region }

resource "aws_secretsmanager_secret" "app_secrets" { name = "prod/medtrace/secrets" }

module "network" {
  source = "../../modules/network"
  vpc_cidr = var.vpc_cidr
  environment = var.environment
  availability_zones = var.availability_zones
  region = var.region
  vpc_endpoint_sg_id = module.security.vpce_sg_id
}

module "security" {
  source = "../../modules/security"
  environment = var.environment
  vpc_id = module.network.vpc_id
}

module "iam" {
  source = "../../modules/iam"
  environment = var.environment
  secret_arns = [aws_secretsmanager_secret.app_secrets.arn]
}

module "ecr_backend" {
  source = "../../modules/ecr"
  repo_name = "medtrace/backend"
}

module "ecr_frontend" {
  source = "../../modules/ecr"
  repo_name = "medtrace/frontend"
}

module "rds" {
  source = "../../modules/rds"
  environment = var.environment
  subnet_ids = module.network.private_db_subnets
  security_group_id = module.security.rds_sg_id
  instance_class = "db.t4g.medium"
  allocated_storage = 100
  deletion_protection = true
  bootstrap_password = var.db_bootstrap_password
}

module "qdrant" {
  source = "../../modules/qdrant"
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.private_app_subnets
  security_group_id = module.security.rds_sg_id
  qdrant_endpoint_service_name = var.qdrant_endpoint_service_name
}

module "alb" {
  source = "../../modules/alb"
  environment = var.environment
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.public_subnets
  security_group_id = module.security.alb_sg_id
  certificate_arn = var.certificate_arn
}

module "waf" {
  source = "../../modules/waf"
  environment = var.environment
  alb_arn = module.alb.alb_arn
}

module "cw_backend" {
  source = "../../modules/cloudwatch"
  environment = var.environment
  service_name = "backend"
}

module "cw_frontend" {
  source = "../../modules/cloudwatch"
  environment = var.environment
  service_name = "frontend"
}

module "ecs_backend" {
  source = "../../modules/ecs"
  environment = var.environment
  service_name = "backend"
  cpu = 2048
  memory = 4096
  image_url = "${module.ecr_backend.repository_url}:${var.backend_image_tag}"
  container_port = 8000
  subnet_ids = module.network.private_app_subnets
  security_group_id = module.security.backend_sg_id
  target_group_arn = module.alb.backend_tg_arn
  execution_role_arn = module.iam.task_execution_role_arn
  task_role_arn = module.iam.task_role_arn
  log_group_name = module.cw_backend.log_group_name
  region = var.region
  desired_count = 2
  environment_vars = [
    { name = "ENVIRONMENT", value = "production" },
    { name = "DEBUG", value = "False" },
    { name = "CORS_ORIGINS", value = "https://${var.domain_name}" }
  ]
  secrets = [
    { name = "DATABASE_URL", valueFrom = "${aws_secretsmanager_secret.app_secrets.arn}:DATABASE_URL::" },
    { name = "SECRET_KEY", valueFrom = "${aws_secretsmanager_secret.app_secrets.arn}:SECRET_KEY::" },
    { name = "LLM_API_KEY", valueFrom = "${aws_secretsmanager_secret.app_secrets.arn}:LLM_API_KEY::" }
  ]
}

module "ecs_frontend" {
  source = "../../modules/ecs"
  environment = var.environment
  service_name = "frontend"
  cpu = 1024
  memory = 2048
  image_url = "${module.ecr_frontend.repository_url}:${var.frontend_image_tag}"
  container_port = 3000
  subnet_ids = module.network.private_app_subnets
  security_group_id = module.security.frontend_sg_id
  target_group_arn = module.alb.frontend_tg_arn
  execution_role_arn = module.iam.task_execution_role_arn
  task_role_arn = module.iam.task_role_arn
  log_group_name = module.cw_frontend.log_group_name
  region = var.region
  desired_count = 2
  environment_vars = [
    { name = "NODE_ENV", value = "production" }
  ]
}
