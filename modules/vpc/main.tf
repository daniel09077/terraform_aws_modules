resource "aws_vpc" "temp_main_vpc"{
    cidr_block = var.vpc_cidr_block
#     lifecycle{
#     prevent_destroy = true
#   }
    tags = {    
        Name = var.vpc_name
    }
}