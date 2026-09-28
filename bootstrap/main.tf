provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "state" {
  bucket_prefix = "terraform-lab-state-"

  tags = {
    Name      = "terraform-lab-state"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "state" {
  bucket = aws_s3_bucket.state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
