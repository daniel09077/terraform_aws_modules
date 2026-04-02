# This is the main Terraform configuration file for the project. It defines the resources and modules that will be created in AWS.
# The configuration includes a VPC, public and private subnets, an internet gateway, a NAT gateway, security groups, and an EC2 instance. 
#The resources are organized into modules for better structure and reusability. Each module is responsible for creating specific resources and outputs that can be used by other modules. The main.tf file orchestrates the creation of all these resources by calling the respective modules with the necessary input variables.
module "vpc" {
  source     = "../modules/vpc_and_more/vpc"
  cidr_block = "10.0.0.0/16"
}

#
module "pub_sub" {
  source     = "../modules/vpc_and_more/pub_sub"
  vpc_id     = module.vpc.temp_main_vpc_id
  cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  azs        = ["us-east-1a", "us-east-1a", "us-east-1c"]
}

#
module "igw" {
  source                 = "../modules/vpc_and_more/internetgateway"
  vpc_id                 = module.vpc.temp_main_vpc_id
  igw_tag                = "main-igw"
  public_route_table_tag = "main-public-route-table"
  subnet_id              = module.pub_sub.public_subnet_ids
}

#
module "priv_sub" {
  source     = "../modules/vpc_and_more/priv_sub"
  vpc_id     = module.vpc.temp_main_vpc_id
  cidr_block = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  azs        = ["us-east-1a", "us-east-1a", "us-east-1c"]
}

#
module "natgateway" {
  source    = "../modules/vpc_and_more/natgateway"
  vpc_id    = module.vpc.temp_main_vpc_id
  subnet_id = module.pub_sub.public_subnet_ids
}

#
module "ec2_server" {
  source        = "../modules/ec2"
  ami           = var.ec2_ami
  instance_type = var.instan_type
  security_group_id = module.security_group.security_group_id
  subnet_id = module.priv_sub.private_subnet_ids[1]
}

#
module "security_group" {
  source = "../modules/security_groups"
  vpc_id = module.vpc.temp_main_vpc_id
}

#
module "web_sg" {
  source = "../modules/security_groups"
  vpc_id = module.vpc.temp_main_vpc_id
}
