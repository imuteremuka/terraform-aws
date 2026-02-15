terraform {
  required_version = "~>1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5"
    }

  }

  backend "s3" {
    bucket = "terraform-backend-im"
    key    = "projecttwo/state.tfstate"
    region = "af-south-1"

  }
}

provider "aws" {
  region = "af-south-1"
}