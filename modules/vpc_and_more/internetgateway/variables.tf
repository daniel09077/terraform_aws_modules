# This file defines the variables for the Internet Gateway module.
variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created."
  type        = string
  default    = ""
}
variable "igw_tag" {
  description = "The tag value for the Internet Gateway."
  type        = string
  default     = "main-igw"
}
variable "public_route_table_tag" {
  description = "The tag value for the public route table."
  type        = string
  default     = "public-route-table"
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