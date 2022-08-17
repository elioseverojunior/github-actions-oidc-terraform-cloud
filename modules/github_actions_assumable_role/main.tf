resource "aws_iam_role" "github_actions" {
  name                  = var.iam_role_name
  description           = var.iam_role_description != null && var.iam_role_description != "" ? var.iam_role_description : null
  assume_role_policy    = data.aws_iam_policy_document.github_actions.json
  max_session_duration  = var.iam_role_max_session_duration
  force_detach_policies = var.force_detach_policies
  tags                  = { Name = "iam-role-github-actions" }
}

data "aws_iam_policy_document" "github_actions" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [var.oidc_provider_arn]
      type        = "Federated"
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringLike"
      values   = var.github_subs
      variable = "token.actions.githubusercontent.com:sub"
    }
  }
}
