locals {
  users_from_yaml = yamldecode(file("${path.module}/users-roles.yaml"))
}

output "users" {
  value = local.users_from_yaml.users[*].role
}