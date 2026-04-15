# This file defines the main resources for the Internet Gateway module.
# It creates an Internet Gateway and attaches it to the specified VPC.
resource "aws_internet_gateway" "igw" {
  
  tags = {
    Name = local.internet_gateway_tag_name
  }
}

#Attachment of the Internet Gateway to the VPC
  resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.temp_main_vpc.id
  
}

# This resource creates a route table for the public subnets and adds a default route to the Internet Gateway.
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.temp_main_vpc.id

  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = local.public_route_table_tag_name
  }
}
# This resource associates the public route table with the public subnets created in the pub_sub module.
resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public_route_table.id

}


