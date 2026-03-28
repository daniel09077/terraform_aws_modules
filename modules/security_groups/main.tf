resource "aws_security_group" "security-group"{
    name = var.security_group_name
    description = var.security_group_description
    vpc_id = var.vpc_id
    tags = {
        Name = var.security_group_name
    }
}