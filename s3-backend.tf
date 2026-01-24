variable "bucket_name" {
      type        = string
      description = "My variable used to set bucket name"
      default     = "terraform-state-bucket"
    }

locals {
      local_example = "This is a local variable"
    }

resource "random_id" "bucket_suffix" {
      byte_length = 6
    }
resource "aws_s3_bucket" "im-s3-backend" {
    bucket = "${var.bucket_name}-${random_id.bucket_suffix.hex}"
    
  
}

output "bucket_id" {
    value = aws_s3_bucket.im-s3-backend.bucket
    }