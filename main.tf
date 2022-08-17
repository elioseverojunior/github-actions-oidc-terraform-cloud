resource "aws_iam_openid_connect_provider" "github_actions" {
  for_each = var.create_oidc_provider ? toset(["enabled"]) : toset()
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
  url  = "https://token.actions.githubusercontent.com"
  tags = { Name = "openid-connect-provider-github-actions" }
}

data "aws_iam_policy_document" "github_actions_role" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [var.create_oidc_provider ? aws_iam_openid_connect_provider.github_actions["enabled"].arn : var.oidc_provider_arn]
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

resource "aws_iam_role" "github_actions" {
  for_each              = var.create_iam_roles ? local.github_subs_by_role : {}
  name                  = var.iam_role_name
  description           = var.iam_role_description != "" && var.iam_role_description == null ? var.iam_role_description : null
  assume_role_policy    = data.aws_iam_policy_document.github_actions_role.json
  max_session_duration  = var.iam_role_max_session_duration
  force_detach_policies = var.force_detach_policies
  tags                  = { Name = "iam-role-github-actions" }
}

# tfsec:ignore:AVD-AWS-0057
data "aws_iam_policy_document" "github_actions_policy_document" {
  statement {
    sid       = "GitHubActionsAllowSelectedIAMPolicies"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }

  statement {
    sid       = "GitHubActionsExplicityDenySelectedIAMPolicies"
    effect    = "Deny"
    actions   = var.policy_statenent_deny["actions"]
    resources = var.policy_statenent_deny["resources"]
  }
}

resource "aws_iam_policy" "github_actions_policy" {
  name        = "GitHubActionsIAMPolicies"
  description = "GitHub Actions IAM Policies"
  policy      = data.aws_iam_policy_document.github_actions_policy_document.json
  tags        = { Name = "github-actions-policy" }
}

resource "aws_iam_role_policy_attachment" "github_actions_policy_attachment" {
  role       = aws_iam_role.github_actions.name
  policy_arn = aws_iam_policy.github_actions_policy.arn
}
