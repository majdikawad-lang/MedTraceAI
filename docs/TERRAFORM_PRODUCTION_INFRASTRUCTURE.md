# Terraform Production Infrastructure

## Directory Structure
The Terraform code is organized into reusable modules and environment-specific instantiations to ensure consistency and isolation.

```text
infra/terraform/
+-- modules/
¦   +-- network/      # VPC, Subnets, Route Tables, NAT, IGW, VPC Endpoints
¦   +-- security/     # Security Groups restricting internal traffic
¦   +-- iam/          # ECS Task & Execution Roles (Least Privilege)
¦   +-- ecr/          # Immutable ECR Repositories (Scan on push)
¦   +-- rds/          # PostgreSQL Multi-AZ (Encrypted, Private)
¦   +-- ecs/          # Fargate Cluster & Service (App definitions)
¦   +-- alb/          # Application Load Balancer & Target Groups
¦   +-- waf/          # AWS WAFv2 associated with ALB
¦   +-- route53_acm/  # DNS Validation and Certificates
¦   +-- cloudwatch/   # Log Groups (Data retention)
¦   +-- s3/           # Encrypted versioned object storage
¦   +-- qdrant/       # AWS PrivateLink integration for Qdrant Cloud
+-- environments/
    +-- staging/      # Staging instantiation (Isolated State & VPC)
    +-- production/   # Production instantiation (Isolated State & VPC)
```

## Module Responsibilities
- **Network & Security**: Ensure strict isolation. Application containers run in private subnets without public IPs. VPC Endpoints route internal AWS API traffic securely.
- **RDS**: Provisions the Multi-AZ encrypted PostgreSQL database. Access is constrained to the Backend ECS Security Group.
- **ECS**: Manages the Fargate task definitions. Handles graceful shutdowns and links Secrets Manager ARNs to container environment variables.
- **ALB & WAF**: The only public ingress point. Traffic is decrypted at the ALB, inspected by WAF, and forwarded over HTTP in the private network.
- **Qdrant**: Establishes the VPC Interface Endpoint required to securely bridge traffic to the dedicated Qdrant Cloud cluster via AWS PrivateLink.

## Environment Separation & State Management
Staging and Production environments are completely decoupled:
1. **Remote State**: Managed in S3 with DynamoDB locking. State files are partitioned by environment prefix (e.g. `staging/terraform.tfstate`, `prod/terraform.tfstate`).
2. **Resource Boundaries**: Each environment spins up its own independent VPC, ECS Cluster, and Database Instance. 
3. **Secret Security**: Terraform manages the *existence* of the AWS Secrets Manager resource (`aws_secretsmanager_secret`), but NOT its content. This guarantees that `terraform.tfstate` will NEVER contain plaintext passwords, API keys, or JWT secrets.

## Secret Population
Because Terraform is explicitly prevented from managing plaintext secret payloads:
1. After `terraform apply` finishes, the empty Secrets Manager object is created.
2. A deployment administrator or securely bootstrapped CI/CD pipeline must manually populate the secret (using AWS CLI or Console).
3. ECS tasks dynamically resolve the secret at runtime.
*Required Secrets:* `DATABASE_URL`, `SECRET_KEY`, `LLM_API_KEY`.

## Required External Qdrant Setup
The Terraform configuration maps a VPC Interface Endpoint to the Qdrant Cloud service name.
- **Prerequisite**: A "Dedicated" cluster must be provisioned in Qdrant Cloud.
- **Prerequisite**: Qdrant Cloud must authorize the AWS Account ID to connect to the AWS PrivateLink Service.
- The `qdrant_endpoint_service_name` variable must be supplied to Terraform.

## Required AWS Prerequisites
1. An S3 bucket (e.g., `medtrace-prod-terraform-state`) and DynamoDB table (`terraform-locks`) must be pre-provisioned out-of-band to bootstrap Terraform remote state.
2. An externally registered Domain Name managed in Route 53.

## Deployment Sequence
1. Ensure S3 State Bucket & DynamoDB Lock Table exist.
2. `terraform init` inside the target environment.
3. `terraform apply -target=module.network -target=module.security -target=module.route53_acm`
4. `terraform apply -target=module.iam -target=module.ecr_backend -target=module.ecr_frontend`
5. Push Docker Images to newly created ECR Repositories.
6. Populate AWS Secrets Manager via AWS CLI.
7. `terraform apply` (Provisions RDS, ECS Clusters, and services).
8. Run Alembic Database Migrations against the RDS endpoint.

## Validation Performed
- Static configuration inspection mapping to architectural constraints.
- Validated absence of `terraform apply` and AWS credential usage.
- Resolved wildcard IAM resource access to explicitly scope to provided ARNs.
- Enforced S3 encryption policies natively in modules.

**INTENTIONALLY SKIPPED COMMANDS**:
- `terraform fmt` / `terraform validate` (Terraform binary omitted from secure workspace to prevent accidental infrastructure mutation).
- `terraform apply` / `terraform destroy` (Explicitly blocked).
- Real AWS API calls (Explicitly blocked).
