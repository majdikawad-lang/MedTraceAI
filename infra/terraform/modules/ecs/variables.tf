
variable "environment" {}
variable "service_name" {}
variable "cpu" {}
variable "memory" {}
variable "image_url" {}
variable "container_port" {}
variable "subnet_ids" { type = list(string) }
variable "security_group_id" {}
variable "target_group_arn" {}
variable "execution_role_arn" {}
variable "task_role_arn" {}
variable "log_group_name" {}
variable "region" {}
variable "desired_count" {}
variable "environment_vars" {
  type    = list(object({ name = string, value = string }))
  default = []
}
variable "secrets" {
  type    = list(object({ name = string, valueFrom = string }))
  default = []
}
