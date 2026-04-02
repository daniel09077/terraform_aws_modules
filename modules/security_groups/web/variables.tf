# This file defines the variables for the security group module. It includes the VPC ID and the ingress rules for the security group.

# This variable defines the ingress rules for the security group. It is a map where each key represents a rule name (e.g., "http") and the value is an object containing the port, protocol, CIDR blocks, and description for that rule. The default configuration allows HTTP access on port 80 from any IP address.
variable "ingress_rules" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))

  default = {
    http = {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = [""]
      description = "Allow HTTP access from anywhere"
    }
  }
}

# The security group will be created in the specified VPC and the ingress rules will be applied to it. The security group ID will be outputted for use in other modules, such as the EC2 instance module.
variable "security_group_id" {
  type = string
  default = ""
  description = "The ID of the security group to which the rules will be added."
}