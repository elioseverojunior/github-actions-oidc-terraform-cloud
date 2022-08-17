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
