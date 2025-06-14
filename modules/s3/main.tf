resource "aws_s3_bucket" "this" {
  bucket = "${var.project_name}-bucket-${random_id.bucket_id.hex}"

  tags = {
    Name = "${var.project_name}-s3"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "expire-objects"
    status = "Enabled"

    expiration {
      days = 90
    }
  }
}