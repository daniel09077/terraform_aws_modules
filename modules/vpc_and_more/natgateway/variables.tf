variable "subnet_id"{
    type = list(string)
    description = "The ID of the subnet where the NAT Gateway will be created."
    default = []
}
variable "nat_gateway_tag" {
    type = string
    description = "The tag value for the NAT Gateway."
    default = "gw-NAT"
}
variable "internet_gateway_id" {
    type = string
    description = "The ID of the Internet Gateway to ensure proper ordering of resource creation."
    default = ""
    }
variable "vpc_id" {
    type = string
    description = "The ID of the VPC where the NAT Gateway will be created."
    default = ""
}
variable "private_subnet_ids"{
    type = list(string)
    description = "The IDs of the private subnets to associate with the private route table."
    default = []
}
variable "azs" {
    type = list(string)
    description = "The availability zones to create the NAT Gateway in."
    default = []
}