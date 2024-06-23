provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}

