output "vpc_id" {
    value = aws_vpc.temp_main_vpc.id
}
output "igw_id" {
  value = aws_internet_gateway.igw.id
}
output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnet[*].id
}
output "public_subnet_ids" {
    value = aws_subnet.public_subnet[*].id
}
output "azs" {
    value = var.azs
}
output "nat_gateway_id" {
    description = "List of NAT Gateway IDs if enabled, otherwise null"
  value = var.enable_natgateway ? [for nat in aws_nat_gateway.natgateway_main : nat.id] : null
}