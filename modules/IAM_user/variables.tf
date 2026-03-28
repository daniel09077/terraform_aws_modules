variable "user_name"{
    type = string
    description = "Holds the value of the user name for the IAM user"
    default = "default-user"
}
variable "policy_arn"{
    type = string
    description = "Holds the value of the policy ARN to attach to the IAM user"
    default = "arn:aws:iam::aws:policy/AdministratorAccess"
}