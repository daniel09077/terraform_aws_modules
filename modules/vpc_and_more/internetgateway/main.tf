# This file defines the main resources for the Internet Gateway module.
# It creates an Internet Gateway and attaches it to the specified VPC.
resource "aws_internet_gateway" "igw" {
  
  tags = {
    Name = var.igw_tag
  }
}

#Attachment of the Internet Gateway to the VPC
  resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = var.vpc_id
  
}

# This resource creates a route table for the public subnets and adds a default route to the Internet Gateway.
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = var.public_route_table_tag
  }
}
# This resource associates the public route table with the public subnets created in the pub_sub module.
resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.subnet_id)
  subnet_id      = var.subnet_id[count.index]
  route_table_id = aws_route_table.public_route_table.id

}


