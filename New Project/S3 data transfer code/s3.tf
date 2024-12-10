provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "source_bucket" {
  bucket = var.bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_configuration_source" {
  bucket = aws_s3_bucket.source_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "source_bucket" {
  bucket = aws_s3_bucket.source_bucket.id
  rule {
    object_ownership = "BucketOwerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "source_bucket" {
  bucket = aws_s3_bucket.source_bucket.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "source_bucket" {
  depends_on = [ 
  aws_s3_bucket_ownership_controls.source_bucket,
  aws_s3_bucket_public_access_block.source_bucket ]

  bucket = aws_s3_bucket.source_bucket.id
  acl = "public-read"

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

resource "aws_s3_bucket_ownership_controls" "destination_bucket" {
  bucket = aws_s3_bucket.destination_bucket.id
  rule {
    object_ownership = "BucketOwerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "destination_bucket" {
  bucket = aws_s3_bucket.destination_bucket.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "destination_bucket" {
  depends_on = [ aws_s3_bucket_ownership_controls.destination_bucket, 
  aws_s3_bucket_public_access_block.destination_bucket
   ]

   bucket = aws_s3_bucket.destination_bucket.id
   acl = "public-read"
}