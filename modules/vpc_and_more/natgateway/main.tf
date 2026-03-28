resource "aws_nat_gateway" "natgateway_main" {
  count         = length(var.subnet_id)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = var.subnet_id[count.index]
  tags          = {
    Name = "${var.nat_gateway_tag}-${count.index+1}"
  }
}