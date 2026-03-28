variable "security_group_name"{
    type = string
    default = "main-sg"
    description = "The name of the security group."
}
variable "security_group_description"{
    type = string
    default = "This informs terraform about the security group being created."
}
variable "vpc_id"{
    type = string

    default = ""
}

