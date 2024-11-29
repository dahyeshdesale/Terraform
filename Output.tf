output "access_key" {
  value = aws_iam_access_key.terraformkey.id
}

output "secret_key" {
  value     = aws_iam_access_key.terraformkey.secret
  sensitive = true
}

output "custom_password" {
  value     = aws_iam_user_login_profile.terraformlogin.password
  sensitive = true
} 

