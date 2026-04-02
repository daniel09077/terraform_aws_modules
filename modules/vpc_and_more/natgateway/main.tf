resource "aws_nat_gateway" "natgateway_main" {
  for_each         = var.azs
  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = var.subnet_id[count.index]
  tags          = {
    Name = "${var.nat_gateway_tag}-${count.index+1}"
  }
}
resource "aws_eip" "nat_eip" {
  count = length(var.subnet_id)
  domain = "vpc"
  tags  = {
    Name = "${var.nat_gateway_tag}-eip-${count.index+1}"
  }
}