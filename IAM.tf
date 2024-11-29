provider "aws" {
  region = "ap-south-1"
}

#resource "random_password" "random_pas" {
 # length = 12
 # upper = true
 # lower = true
  #number = true
 # special = true
#}

# Create IAM User
resource "aws_iam_user" "dreamdesale" {
  name = "dreamdesale"
  force_destroy = true
}

# Console Login
resource "aws_iam_user_login_profile" "terraformlogin" {
  user = aws_iam_user.dreamdesale.name
  password = var.iam_user_passwordg
  password_reset_required = false
}

#Programmatic Access
resource "aws_iam_access_key" "terraformkey" {
  user = aws_iam_user.dreamdesale.name
}

#S3 fullaccess
resource "aws_iam_user_policy_attachment" "S3_full_access" {
  user = aws_iam_user.dreamdesale.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

#AdminAccess
#resource "aws_iam_user_policy_attachment" "Admin_access" {
  #user = aws_iam_user.dreamdesale.name
  #policy_arn = "aen:aws:iam::aws:policy/AdministratorAccess"
#}

#To store user details
resource "local_file" "user_details" {
  content = <<EOF
  username: ${aws_iam_user.dreamdesale.name}
  access key id: ${aws_iam_access_key.terraformkey.id}
  secret access key: ${aws_iam_access_key.terraformkey.secret}
  EOF
  filename = "${path.module}/user_details.txt"
}
