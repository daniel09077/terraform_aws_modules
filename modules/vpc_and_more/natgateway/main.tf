#NATGATEWAY 
resource "aws_nat_gateway" "natgateway_main" {
  for_each         = local.removed_dopple_gangers
  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = local.map_az_to_subnet[each.key][0]
  tags          = {
    Name = "${var.nat_gateway_tag}-${each.key+1}"
  }
}
#elastic IP for the subnets attached to the Natgateway 
resource "aws_eip" "nat_eip" {
for_each = toset(var.azs)
  domain   = "vpc"
  tags = {
    Name = "${var.nat_gateway_tag}-eip-${each.key}"
  }
}