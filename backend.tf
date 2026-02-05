/* terraform {
  required_version = "~>1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.5"
    }
  }
  backend "s3" {
    bucket = "terraform-backend123"
    key    = "terraformproj/state.tfstae"
  }
}

provider "aws" {
  region = "var.aws_region"

} */