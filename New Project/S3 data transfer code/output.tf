output "publicbucket" { 
    value = aws_s3_bucket.source_bucket.bucket 
}