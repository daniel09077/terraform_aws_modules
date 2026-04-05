variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created."
  type        = string
}
variable "cidr_block" {
  description = "The CIDR block for the subnet"
  type        = list(string)
  default = []
}
variable "azs" {
  description = "The availability zones for the subnets"
  type        = list(string)
  default = ["us-east-1a"]
}

variable "private_subnet_names" {
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated"
  type        = list(string)
  default     = []
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private-subnet"
}

