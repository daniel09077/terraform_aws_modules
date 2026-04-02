resource "aws_security_group_rule" "ingress" {
  for_each          = var.ingress_rules
type              = "ingress"
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = var.security_group_id
description = each.value.description
}


