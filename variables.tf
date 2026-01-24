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
  local_example = "This is a local variable"
}

variable "environment" {
  type        = string
  description = "The environment for the resources"
  default     = "dev"
}