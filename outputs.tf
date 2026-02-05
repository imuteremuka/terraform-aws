output "aws_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.im-s3-backend.id
}

output "operators" {
  value = {
    math       = local.math
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
  }
}