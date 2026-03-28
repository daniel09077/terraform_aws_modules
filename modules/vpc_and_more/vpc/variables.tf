variable "cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = ""
}   
variable "vpc_name"{
    description = "The name referencing the VPC"
    type = string
    default = "temp_main_vpc"
}
variable "prevent_destroy" {
  description = "Whether to prevent the destruction of the VPC and its resources. Set to true to prevent accidental deletion."
  type        = bool
  default     = false
}