output "nat_gateway_id" {
  value = values(aws_nat_gateway.natgateway_main)[*].id
}