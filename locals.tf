locals {
  # Load users and roles from YAML
  users_from_yaml = yamldecode(file("${path.module}/users-roles.yaml"))

  # Map username => list of roles
  users_map = {
    for user_config in local.users_from_yaml :
    user_config.username => user_config.roles
  }
}

locals {
  # Ensure roles are flattened (safe even if already flat)
  flattened_users_map = {
    for user, roles in local.users_map :
    user => flatten(roles)
  }
}

locals {
  # Role to IAM policy mapping
  role_policies = {
    readonly = [
      "ReadOnlyAccess"
    ]
    admin = [
      "AdministratorAccess"
    ]
    auditor = [
      "SecurityAudit"
    ]
    developer = [
      "PowerUserAccess",
      "AmazonS3FullAccess",
      "AmazonEC2FullAccess"
    ]
  }

  # Flatten role-policy relationships for for_each usage
  role_policies_list = flatten([
    for role, policies in local.role_policies : [
      for policy in policies : {
        role   = role
        policy = policy
      }
    ]
  ])
}
