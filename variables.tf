variable "bucket_name" {
  type        = string
  description = "My variable used to set bucket name"
  default     = "terraform-state-bucket"
}

variable "aws_region" {
  type        = string
  description = "My variable used to set bucket name"
  default     = "af-south-1"
}


locals {
  common_tags = {
    Project   = "TerraformLearning"
    ManagedBy = "Terraform"
  }
}

variable "environment" {
  type        = string
  description = "The environment for the resources"
  default     = "dev"
}