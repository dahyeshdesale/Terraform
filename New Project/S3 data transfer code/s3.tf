provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "source_bucket" {
  bucket = "dahyeshdesaledatasource"
  acl = "public-read"
  force_destroy = true
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = "dsahyeshdesaledatadestination"
  acl = "public-read"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "source_bucket_policy" {
  bucket = aws_s3_bucket.source_bucket.id
  policy = <<POLICY
{ "Version": "2012-10-17", 
  "Statement": [ 
  { "Effect": "Allow", 
    "Principal": "*", 
    "Action": "s3:GetObject", 
    "Resource": "${aws_s3_bucket.source_bucket.arn}/*" 
  } 
] 
} 
POLICY  
}

resource "aws_s3_bucket_policy" "destination_bucket_policy" {
  bucket = aws_s3_bucket.destination_bucket.id
  policy = <<POLICY
{ "Version": "2012-10-17", 
  "Statement": [ 
  { "Effect": "Allow", 
    "Principal": "*", 
    "Action": "s3:GetObject", 
    "Resource": "${aws_s3_bucket.destination_bucket.arn}/*" 
  } 
] 
} 
POLICY  
}


