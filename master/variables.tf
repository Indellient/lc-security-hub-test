variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "audit_s3_bucket_name" {
  description = "The name of the S3 bucket to store various audit logs."
  default     = "lc-audit-test"
}

variable "region" {
  description = "The AWS region in which global resources are set up."
  default     = "us-east-1"
}

variable "member_accounts" {
  description = "A list of AWS account IDs."
  default     = []
}