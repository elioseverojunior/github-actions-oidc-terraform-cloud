variable "assume_role_name" {
  description = "AWS IAM Assume Role Name"
  type        = string
  default     = "GitHubOrganizationAccountAssumeRole"
}

variable "create_oidc_provider" {
  description = "Whether or not to create the associated oidc provider. If true, variable 'oidc_provider_arn' is required"
  type        = bool
  default     = true
}

variable "oidc_provider_arn" {
  description = "ARN of the github actions AWS oidc provider. Used if create_oidc_provider is true"
  type        = string
  default     = null
}

variable "create_iam_roles" {
  description = "Whether or not to create IAM roles."
  type        = bool
  default     = true
}

variable "policy_statenent_deny" {
  description = "Policy Stament Deny"
  type = object({
    actions   = list(string)
    resources = list(string)
  })
}

variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "iam_role_description" {
  description = "AWS IAM Role Description"
  type        = string
  default     = "GitHub Organization Account Assume Role"
}

variable "github_subs" {
  description = "Values of the 'sub' field that will authorize OIDC users to assume the role"
  type        = set(string)
}

variable "iam_role_max_session_duration" {
  description = "Max Session Duration in Seconds"
  type        = number
  validation {
    condition     = (var.iam_role_max_session_duration >= 3600 && var.iam_role_max_session_duration < 43200)
    error_message = "Invalid IAM Role Max Session Duration value. It must be greater or equal than \"3600\" (1 hour) and less than \"43200\" (12 hours)."
  }
  default = 7200
}

variable "force_detach_policies" {
  description = "AWS IAM Detach Policies"
  type        = bool
  default     = true
}

variable "tags" {
  description = "AWS Tags"
  type        = map(any)
  default = {
    Country     = "BR"
    Environemnt = "dev"
    Name        = "github-actions-assume-role"
  }
}
