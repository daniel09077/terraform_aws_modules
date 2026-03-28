variable "instance_type"{
    type = string
    default = ""
    description = "The type of instance to use for the EC2 instance."
}
variable "ami"{
    type = string
    default = ""
    description = "The Image type for the EC2 instance."
}
variable "security_group_id"{
    type = string
    default = ""
    description = "The security group ID to associate with the EC2 instance."
}
variable "subnet_id"{
    type =  string
    default = ""
    description = "Subnet ID to deply instance in"
}