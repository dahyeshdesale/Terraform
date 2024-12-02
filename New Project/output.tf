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

output "console_signin_url" {
  value = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}
