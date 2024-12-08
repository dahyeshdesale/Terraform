provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "source_bucket" {
  bucket = "dahyeshdesaledatasource"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_configuration_source" {
  bucket = aws_s3_bucket.source_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = "dsahyeshdesaledatadestination"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_configuration_destination" {
  bucket = aws_s3_bucket.destination_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
