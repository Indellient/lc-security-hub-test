provider "aws" {
  region = var.region
}

module "terraform_state_backend" {
  source  = "cloudposse/tfstate-backend/aws"
  version = "0.33.0"

  namespace  = "lc"
  stage      = "dev"
  name       = "org"
  attributes = ["state"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}