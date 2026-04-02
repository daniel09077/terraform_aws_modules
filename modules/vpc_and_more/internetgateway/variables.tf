# This file defines the variables for the Internet Gateway module.
variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created."
  type        = string
  default    = ""
}
#--------LOCAL BLOCK INTERNET GATEWAY TAG NAME----------------
locals{
  internet_gateway_tag_name = var.igw_tag == ""?"main-igw": var.igw_tag 
  public_route_table_tag_name = var.public_route_table_tag == ""?"public-route-table": var.public_route_table_tag
}

#---------INTERNET GATEWAY GENRAL TAG NAME END------------

variable "igw_tag" {
  description = "The tag value for the Internet Gateway."
  type        = string
  default     = ""

}
variable "public_route_table_tag" {
  description = "The tag value for the public route table."
  type        = string
  default     = ""
}
variable "subnet_id" {
  description = "The ID of the subnet to associate with the public route table."
  type        = list(string)
  default     = []
}
variable "prevent_destroy" {
  description = "Whether to prevent the destruction of the Internet Gateway and its attachment. Set to true to prevent accidental deletion."
  type        = bool
  default     = false
}
variable "public_cidr"{
  type = string
  description = "The CIDR block for the public route. Default is 0.0.0/0, which allows all traffic to the Internet."
  default = "0.0.0.0/0"
}