output "iam_role" {
  description = "AWS IAM role"
  value       = aws_iam_role.github_actions
}

output "iam_role_arn" {
  description = "ARN of the created IAM role"
  value       = aws_iam_role.github_actions.arn
}

output "iam_role_name" {
  description = "Name of the created IAM role"
  value       = aws_iam_role.github_actions.name
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = var.create_oidc_provider ? aws_iam_openid_connect_provider.github_actions["enabled"].arn : var.oidc_provider_arn
}

output "github_actions_assume_role_name" {
  description = "GitHub Actions AssumeRole Name"
  value       = var.assume_role_name
}

output "github_actions_policy_data" {
  value = data.aws_iam_policy_document.github_actions_policy_document.json
}

output "github_actions_iam_policy" {
  value = aws_iam_policy.github_actions_policy
}
