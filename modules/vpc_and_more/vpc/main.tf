resource "aws_vpc" "temp_main_vpc"{
    cidr_block = var.cidr_block
#     lifecycle{
#     prevent_destroy = true
#   }
    tags = {    
        Name = var.vpc_name
    }
}