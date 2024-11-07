output "s3_bucket_arn" {
  value       = aws_s3_bucket.tf-state.arn
  description = "The ARN of the S3 Bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.tf-state-locks.name
  description = "The Name of the DynamoDB Table"
}