resource "aws_iam_user" "users" {
  for_each = { for user in local.users_from_yaml.users : user.name => user }

  name = each.value.name

}

resource "aws_iam_user_login_profile" "userlogin" {
  for_each        = aws_iam_user.users
  user            = each.value.name
  password_length = 8

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }

}
