variable aws_region {
  description = "The AWS region to create resources in."
  type        = string
  default     = "af-south-1"
}

variable "bucket-name" {
    description = "The name of the S3 bucket to create."
    type        = string
    default     = "terraform-s3-bucket-im"
  
}