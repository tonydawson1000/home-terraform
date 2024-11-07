###
# Create an S3 Bucket to store our Terraform State
###
resource "aws_s3_bucket" "tf-state" {
  bucket = var.tf_remote_state_s3_bucket_name

  # Prevent deletion of this S3 Bucket
  lifecycle {
    prevent_destroy = true
  }
}

###
# Enable 'Versioning' - so every update creates a new file
# Keeps track of a full revision history of state file changes 
###
resource "aws_s3_bucket_versioning" "tf-state" {
  bucket = aws_s3_bucket.tf-state.id

  versioning_configuration {
    status = "Enabled"
  }
}

###
# Enable 'Server-Side' encryption for the contents stored in S3 Bucket
###
resource "aws_s3_bucket_server_side_encryption_configuration" "tf-state" {
  bucket = aws_s3_bucket.tf-state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

###
# Explicitly block all public access to the S3 Bucket
###
resource "aws_s3_bucket_public_access_block" "tf-state" {
  bucket = aws_s3_bucket.tf-state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

###
# Enable Locking
###
resource "aws_dynamodb_table" "tf-state-locks" {
  name         = var.tf_remote_state_table_lock_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}