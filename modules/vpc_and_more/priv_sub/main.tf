resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  count = length(var.cidr_block)
  cidr_block        = var.cidr_block[count.index]
  availability_zone = var.azs[count.index]
  lifecycle{
    prevent_destroy = false
  }

  tags              = {
    Name = "${var.private_subnet_suffix}-${count.index}"
}


 }