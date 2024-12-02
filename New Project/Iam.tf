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
  password = "Dahyesh@1199"
  password_reset_required = true
}

resource "local_file" "info_user_login" {
  content = <<EOF
  username: ${aws_iam_user.dahyesh_user.name}
  password: ${aws_iam_user_login_profile.dahyesh_login.password}
  EOF
  filename = "${path.module}/info_user_login.txt"

}