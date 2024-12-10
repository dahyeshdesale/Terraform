output "publicbucket" { 
    value = aws_s3_bucket.source_bucket.bucket 
}

output "bucket" { 
    value = aws_s3_bucket.destination_bucket.bucket 
}