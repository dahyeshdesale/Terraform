provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "publicbucket" {
  bucket = "dahyeshdesaledataspace"
  acl = "public-read"
  versioning {
   enabled = true 
  }
  force_destroy = true
}



