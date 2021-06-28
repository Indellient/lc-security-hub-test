provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "terraform_state_backend" {
  source     = "cloudposse/tfstate-backend/aws"
  version    = "0.33.0"

  namespace  = "lc"
  stage      = "dev"
  name       = "master-test"
  attributes = ["state"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
 }

data "aws_caller_identity" "current" {
}

resource "aws_iam_user" "admin" {
  name = "admin"
}

module "secure_baseline" {
  source  = "nozaq/secure-baseline/aws"
  version = "0.27.0"

  account_type                         = "master"
  member_accounts                      = var.member_accounts
  audit_log_bucket_name                = var.audit_s3_bucket_name
  aws_account_id                       = data.aws_caller_identity.current.account_id
  region                               = var.region
  support_iam_role_principal_arns      = [aws_iam_user.admin.arn]
  target_regions                       = ["us-east-1", "ca-central-1"]
  guardduty_disable_email_notification = true

  audit_log_bucket_force_destroy = true

  providers = {
    aws                = aws
    aws.ap-northeast-1 = aws.ap-northeast-1
    aws.ap-northeast-2 = aws.ap-northeast-2
    aws.ap-northeast-3 = aws.ap-northeast-3
    aws.ap-south-1     = aws.ap-south-1
    aws.ap-southeast-1 = aws.ap-southeast-1
    aws.ap-southeast-2 = aws.ap-southeast-2
    aws.ca-central-1   = aws.ca-central-1
    aws.eu-central-1   = aws.eu-central-1
    aws.eu-north-1     = aws.eu-north-1
    aws.eu-west-1      = aws.eu-west-1
    aws.eu-west-2      = aws.eu-west-2
    aws.eu-west-3      = aws.eu-west-3
    aws.sa-east-1      = aws.sa-east-1
    aws.us-east-1      = aws.us-east-1
    aws.us-east-2      = aws.us-east-2
    aws.us-west-1      = aws.us-west-1
    aws.us-west-2      = aws.us-west-2
  }
}