
resource "aws_cloudwatch_log_group" "app" {
  name              = "/ecs/${var.environment}-${var.service_name}"
  retention_in_days = var.retention_days
}
