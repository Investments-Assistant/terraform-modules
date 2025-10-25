resource "aws_s3_bucket" "aws_s3_bucket" {
  bucket_prefix = "${var.use_case_name_short}-${var.repository_name}-terraform-state-"
}

resource "aws_s3_bucket_versioning" "aws_s3_bucket_versioning" {
  bucket = aws_s3_bucket.aws_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
