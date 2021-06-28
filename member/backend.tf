terraform {
  required_version = ">= 0.13"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "lc-dev-security-hub-test-state"
    key            = "terraform.tfstate"
    dynamodb_table = "lc-dev-security-hub-test-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
