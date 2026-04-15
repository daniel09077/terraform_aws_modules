# locals.tf
############################
# TAG DEFAULTS
############################
locals {
  internet_gateway_tag_name = var.igw_tag == "" ? "main-igw" : var.igw_tag
  public_route_table_tag_name = var.public_route_table_tag == "" ? "public-route-table" : var.public_route_table_tag
}

############################
# AZ TO SUBNET MAPPING
############################
locals {
 
  public_subnet_az = {
   
     for i in aws_subnet.public_subnet : i.availability_zone => i.id...
   }
}