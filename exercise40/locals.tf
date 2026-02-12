locals {
  # Load users and roles from YAML
  users_from_yaml = yamldecode(file("${path.module}/users-roles.yaml"))

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
