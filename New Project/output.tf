output "aws_iam_account_password_policy" {
  value = aws_iam_account_password_policy.dahyesh
}  

output "aws_iam_user" {
  value = aws_iam_user.dahyesh_user
}

output "aws_iam_user_login_profile" {
  value = aws_iam_user_login_profile.dahyesh_login
  sensitive = true
}