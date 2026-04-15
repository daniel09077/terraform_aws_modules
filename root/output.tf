output "vpc_cidr" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
output "private_subnet_ids" {
  value = "Private Subnets: ${join(", ", module.vpc.private_subnet_ids)}"
}
output "igw_id" {
  value = module.vpc.igw_id
}
output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}
output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}
output "ec2_private_ip" {
  value = module.ec2_server.priv_ip
}
output "ec2_public_ip" {
  value = module.ec2_server.pub_ip
}