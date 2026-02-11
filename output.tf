output "users" {
  value = local.users_from_yaml.users[*].role
}

output "passwords" {
  value = {
    for user, user_login in aws_iam_user_login_profile.userlogin : user => user_login.password
  }
  sensitive = true
}

output "policies" {
  value = local.role_policies_list

}

output "flatten_users" {
  value = local.flattened_users_map
}