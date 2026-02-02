terraform {
  required_version = "~>1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.2"
    }
  }
  backend "s3" {
    bucket = "s3proj-terraform-backend"
    key    = "global/s3proj/state.tfstate"
    region = "af-south-1"
  }

}

provider "aws" {
  region = var.aws_region

}