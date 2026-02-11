data "aws_iam_policy_document" "assume_role_policies" {
  for_each = toset(keys(local.role_policies))
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::653838381744:user/Charlie"]
    }
  }
}

data "aws_iam_policy" "managed_policies" {
  for_each = toset(local.role_policies_list[*].policy)
  arn      = "arn:aws:iam::aws:policy/${each.key}"
}


resource "aws_iam_role" "roles" {
  for_each           = toset(keys(local.role_policies))
  name               = each.key
  assume_role_policy = data.aws_iam_policy_document.assume_role_policies[each.key].json


}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  count      = length(local.role_policies_list)
  role       = local.role_policies_list[count.index].role
  policy_arn = data.aws_iam_policy.managed_policies[local.role_policies_list[count.index].policy].arn
}