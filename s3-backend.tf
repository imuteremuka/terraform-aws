
resource "random_id" "bucket_suffix" {
  byte_length = 6
}
resource "aws_s3_bucket" "im-s3-backend" {
  bucket = "${var.bucket_name}-${random_id.bucket_suffix.hex}"


}

resource "aws_s3_bucket_public_access_block" "im-s3-backend-block" {
  bucket = aws_s3_bucket.im-s3-backend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

output "bucket_id" {
  value = aws_s3_bucket.im-s3-backend.bucket
}

resource "aws_s3_bucket_policy" "static-website-policy" {
  bucket = aws_s3_bucket.im-s3-backend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.im-s3-backend.arn}/*"
      }
    ]
  })

}

resource "aws_s3_bucket_website_configuration" "im-s3-backend-website" {
  bucket = aws_s3_bucket.im-s3-backend.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.im-s3-backend.id
  key    = "index.html"
  source = "build/index.html"
  etag   = filemd5("build/index.html")
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.im-s3-backend.id
  key    = "error.html"
  source = "build/error.html"
  etag   = filemd5("build/error.html")
  content_type = "text/html"
}