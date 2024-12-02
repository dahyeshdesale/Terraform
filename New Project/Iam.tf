provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_account_password_policy" "dahyesh" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

resource "aws_iam_user" "dahyesh_user" {
  name = "dahyesh"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "dahyesh_login" {
  user = aws_iam_user.dahyesh_user.name
  password_reset_required = true
}

data "aws_caller_identity" "current" {

}

resource "aws_iam_access_key" "CLI" {
  user = aws_iam_user.dahyesh_user.name

}

resource "aws_iam_user_policy_attachment" "S3_full_access" {
  user = aws_iam_user.dahyesh_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "local_file" "info_user_login" {
  content = <<EOF
  username: ${aws_iam_user.dahyesh_user.name}
  password: ${aws_iam_user_login_profile.dahyesh_login.password}
  console_signin_url: https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console
  access key id: ${aws_iam_access_key.dahyesh_user.id}
  secret access key: ${aws_iam_access_key.dahyesh_user.secret}
  EOF
  filename = "${path.module}/info_user_login.txt"

}