output "access_key" {
  value = aws_iam_access_key.terraformkey.id
}

output "secret_key" {
  value     = aws_iam_access_key.terraformkey.secret
  sensitive = true
}