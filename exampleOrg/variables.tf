variable "region" {
  description = "The AWS region in which global resources are set up."
  default     = "us-east-1"
}

variable "email_group" {
  type        = string
  description = "Email group name"
  default     = "aws-admins"
}
