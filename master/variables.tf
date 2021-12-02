variable "audit_s3_bucket_name" {
  description = "The name of the S3 bucket to store various audit logs."
  default     = "lc-audit-master"
}

variable "region" {
  description = "The AWS region in which global resources are set up."
  default     = "us-east-1"
}

variable "exception_member_accounts" {
  description = "A list of AWS member account IDs to NOT actively monitor."
  default     = ["Sandbox"]
}

variable "sns_subscription_email" {
  description = "Subscription email to send SNS topics notifications to"
  type        = string
}