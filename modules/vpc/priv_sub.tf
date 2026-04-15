resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.temp_main_vpc.id
  count = length(var.private_subnet_cidrs)
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  lifecycle{
    prevent_destroy = false
  }

  tags              = {
    Name = "${var.private_subnet_suffix}-${count.index}"
}


 }