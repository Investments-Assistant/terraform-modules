output "aws_s3_bucket_name" {
    description = "The name of the S3 bucket"
    value       = aws_s3_bucket.aws_s3_bucket.id
}
