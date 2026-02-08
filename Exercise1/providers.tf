terraform {
 required_version = "~> 1.14.3"
  required_providers {
    aws = {
     source  = "hashicorp/aws"
     version = "~> 6.28.0"
    
  }
  random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
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
