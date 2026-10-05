
variable "environment" {}
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "security_group_id" {}
variable "certificate_arn" {}
