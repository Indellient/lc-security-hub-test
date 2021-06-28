terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "lc-dev-master-test-state"
    key            = "terraform.tfstate"
    dynamodb_table = "lc-dev-master-test-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
