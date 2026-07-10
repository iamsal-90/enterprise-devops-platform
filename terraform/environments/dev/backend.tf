terraform {
  backend "s3" {
    bucket         = "edp-terraform-state-bucket-2026"
    key            = "dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "edp-terraform-state-lock"
    encrypt        = true
  }
}

