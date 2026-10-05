
variable "environment" {}
variable "subnet_ids" { type = list(string) }
variable "security_group_id" {}
variable "instance_class" { default = "db.t4g.medium" }
variable "allocated_storage" { default = 50 }
variable "backup_retention_period" { default = 30 }
variable "deletion_protection" { default = true }
variable "bootstrap_password" { sensitive = true }
