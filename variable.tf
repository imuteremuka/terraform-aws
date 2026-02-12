variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "af-south-1"

}

locals {
  common_tags = {
    Environment = "dev"
    Project     = "im-project"
    Name        = "im-project-module"
  }
}