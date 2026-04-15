###################################
# MASTER INFRASTRUCTURE OUTPUT MAP
###################################
locals {
  master_infrastructure_map = {
    network         = module.vpc
    ec2             = module.ec2_server
    security_groups = module.security_group
    web_security    = module.web_sg
  }
}

###################################
# VPC + NETWORKING
###################################
module "vpc" {
  source = "../modules/vpc"

  vpc_cidr_block = "10.0.0.0/16"

  private_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
  enable_natgateway = false

  public_subnet_cidrs = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]

  azs = [
    "us-east-1a",
    "us-east-1a",
    "us-east-1c",
  ]

}

###################################
# SECURITY GROUPS
###################################
module "security_group" {
  source = "../modules/security_groups"
  vpc_id = module.vpc.vpc_id

}

module "web_sg" {
  source = "../modules/security_groups"
  vpc_id = module.vpc.vpc_id


}

###################################
# EC2
###################################
module "ec2_server" {
  source            = "../modules/ec2"
  ami               = var.ec2_ami
  instance_type     = var.instan_type
  security_group_id = module.security_group.security_group_id
  subnet_ids        = module.vpc.private_subnet_ids[0]
}

###################################
# LOCAL OUTPUT FILE
###################################
resource "local_file" "outputs_file" {
  content  = jsonencode(local.master_infrastructure_map)
  filename = "${path.module}/outputs.json"
}