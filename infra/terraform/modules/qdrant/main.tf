
resource "aws_vpc_endpoint" "qdrant" {
  count               = var.qdrant_endpoint_service_name != "" ? 1 : 0
  vpc_id              = var.vpc_id
  service_name        = var.qdrant_endpoint_service_name
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.subnet_ids
  security_group_ids  = [var.security_group_id]
  private_dns_enabled = false
}
