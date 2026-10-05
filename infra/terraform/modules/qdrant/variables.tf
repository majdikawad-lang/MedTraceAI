
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "security_group_id" {}
variable "qdrant_endpoint_service_name" { default = "" }
