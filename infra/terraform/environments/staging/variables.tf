
variable "region" { default = "us-east-1" }
variable "environment" { default = "staging" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "availability_zones" { default = ["us-east-1a", "us-east-1b"] }
variable "domain_name" { default = "staging.medtrace.example.com" }
variable "certificate_arn" {}
variable "backend_image_tag" {}
variable "frontend_image_tag" {}
variable "qdrant_endpoint_service_name" { default = "" }
variable "db_bootstrap_password" {
  sensitive = true
  default   = "placeholder"
}
