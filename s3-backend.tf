
resource "random_id" "bucket_suffix" {
  byte_length = 6
}
resource "aws_s3_bucket" "im-s3-backend" {
  bucket = "${var.bucket_name}-${random_id.bucket_suffix.hex}"


}

output "bucket_id" {
  value = aws_s3_bucket.im-s3-backend.bucket
}