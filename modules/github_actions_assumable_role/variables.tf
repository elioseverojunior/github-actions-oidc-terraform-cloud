variable "oidc_provider_arn" {
  description = "ARN of the github actions AWS oidc provider"
  type        = string
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
  description = "AWS IAM Assume Role Name"
  type        = map(any)
}
