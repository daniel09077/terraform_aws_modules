output "pub_ip"{
    value = aws_instance.test_ec2.public_ip
    description = "Outputs the public ip address of the Ec2 instance"
}
output "priv_ip"{
value = aws.instance.test_ec2.private_ip
description = "Output the private ip address of the instance"
}