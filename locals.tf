locals {
  users_from_yaml = yamldecode(file("${path.module}/users-roles.yaml"))
}