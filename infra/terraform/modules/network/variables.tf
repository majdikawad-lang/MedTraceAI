
variable "vpc_cidr" {}
variable "environment" {}
variable "availability_zones" { type = list(string) }
variable "region" {}
variable "vpc_endpoint_sg_id" {}
