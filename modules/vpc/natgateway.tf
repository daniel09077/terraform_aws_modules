#NATGATEWAY 
resource "aws_nat_gateway" "natgateway_main" {
  for_each = var.enable_natgateway ? toset(var.azs) : toset([])
  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id = [
    for s in aws_subnet.public_subnet : s.id if s.availability_zone == each.key
  ][0]
  tags = {
    Name = "${var.nat_gateway_tag}-${each.key}"
  }
}
#elastic IP for the subnets attached to the Natgateway 
resource "aws_eip" "nat_eip" {
  for_each = var.enable_natgateway ? toset(var.azs) : toset([])
  domain   = "vpc"
  tags = {
    Name = "${var.nat_gateway_tag}-eip-${each.key}"
  }

}




resource "aws_route_table" "private_route_table" {
  for_each = var.enable_natgateway ? toset(var.azs) : toset([])
  vpc_id = aws_vpc.temp_main_vpc.id
}


resource "aws_route" "private_internet_access" {
  for_each = var.enable_natgateway ? toset(var.azs) : toset([])
  route_table_id         = aws_route_table.private_route_table[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgateway_main[each.key].id
}
#association the private subnets to the natgateway
resource "aws_route_table_association" "private_assoc" {
  count = var.enable_natgateway ? length(var.private_subnet_cidrs) : 0

  # This is the specific private subnet from your list
  subnet_id = aws_subnet.private_subnet[count.index].id

  # This looks up the Route Table that matches this subnet's AZ
  route_table_id = aws_route_table.private_route_table[var.azs[count.index]].id
}
