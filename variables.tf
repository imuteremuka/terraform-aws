variable "aws_region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "af-south-1"
}

variable "bucket-name" {
  description = "The name of the S3 bucket to create."
  type        = string
  default     = "terraform-s3-bucket-im"

}

variable "subnet-count" {
  description = "The number of subnets to create."
  type        = number
  default     = 2
}

variable "ec2_instance_count" {
  description = "The number of EC2 instances to create."
  type        = number
  default     = 2
}