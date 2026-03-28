resource "aws_instance" "test_ec2"{
    instance_type = var.instance_type
    ami = var.ami
    security_groups = [var.security_group_id]
    subnet_id = var.subnet_id
   
    tags = {
        Name = "Test EC2 Instance"
    }

}