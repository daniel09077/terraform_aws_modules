resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  count = length(var.cidr_block)
  cidr_block        = var.cidr_block[count.index]
  availability_zone = var.azs[count.index]
  # lifecycle{
  #   prevent_destroy = true
  # }

  tags              = {
    Name = "${var.public_subnet_suffix}-${count.index}"
}


 }