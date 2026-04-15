############################
# VPC VARIABLES
############################
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "temp_main_vpc"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = ""
}

variable "prevent_destroy" {
  description = "Prevent accidental deletion of VPC resources"
  type        = bool
  default     = false
}

############################
# SUBNET VARIABLES
############################
variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "azs" {
  description = "Availability zones for subnets and NAT gateways"
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "public_subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
  default     = []
}

variable "private_subnet_names" {
  description = "Explicit Name tags for private subnets"
  type        = list(string)
  default     = []
}
variable "enable_natgateway"{
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = false
}

variable "private_subnet_suffix" {
  description = "Suffix for generated private subnet names"
  type        = string
  default     = "private-subnet"
}
variable "public_subnet_suffix" {
  description = "Suffix for generated public subnet names"
  type        = string
  default     = "public-subnet"
}

############################
# INTERNET GATEWAY VARIABLES
############################
variable "igw_tag" {
  description = "Internet Gateway tag"
  type        = string
  default     = ""
}

variable "internet_gateway_id" {
  description = "Existing Internet Gateway ID for dependencies"
  type        = string
  default     = ""
}

variable "public_route_table_tag" {
  description = "Public route table tag"
  type        = string
  default     = ""
}

variable "public_cidr" {
  description = "CIDR block for public route"
  type        = string
  default     = "0.0.0.0/0"
}

############################
# NAT GATEWAY VARIABLES
############################
variable "nat_gateway_tag" {
  description = "NAT Gateway tag"
  type        = string
  default     = "gw-NAT"
}