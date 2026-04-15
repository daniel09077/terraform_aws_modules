resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.temp_main_vpc.id
  count = length(var.public_subnet_cidrs)
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  # lifecycle{
  #   prevent_destroy = true
  # }

  tags              = {
    Name = "${var.public_subnet_suffix}-${count.index+1}"
}


 }