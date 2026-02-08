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

variable "ec2_instance_type" {
  type        = string
  description = "The type of EC2 instance to create"
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only support t2 or t3 micros"
  }


}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  default = {
    size = 10
    type = "gp3"
  }
}

locals {
  math       = 2 * 2
  equality   = 2 != 2
  comparison = 2 < 1
  logical    = true || false
}