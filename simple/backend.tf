terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "us-east-1"
    bucket         = "lc-dev-simple-test-state"
    key            = "terraform.tfstate"
    dynamodb_table = "lc-dev-simple-test-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
