output "security_group_id" {
  value = aws_security_group.security-group.id
  description = "The ID of the security group created."
}