resource "aws_s3_bucket" "state_file" {
  bucket = "my-tf-state_file"

  tags = {
    Name        = "state_file"
    
  }

  }

resource "aws_s3_bucket_versioning" "versioning_status" {
  bucket = aws_s3_bucket.state_file.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_file_server_side_encryption" {
  bucket = aws_s3_bucket.state_file.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}