# GitHub Actions AWS IAM Assume Role with Provider OIDC

## Pre-Requirements

### Terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0, < 5.0.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.26.0 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.github_actions_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.github_actions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.github_actions_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.github_actions_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.github_actions_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_subs"></a> [github\_subs](#input\_github\_subs) | Values of the 'sub' field that will authorize OIDC users to assume the role | `set(string)` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the IAM role | `string` | n/a | yes |
| <a name="input_policy_statenent_deny"></a> [policy\_statenent\_deny](#input\_policy\_statenent\_deny) | Policy Stament Deny | <pre>object({<br>    actions   = list(string)<br>    resources = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_assume_role_name"></a> [assume\_role\_name](#input\_assume\_role\_name) | AWS IAM Assume Role Name | `string` | `"GitHubOrganizationAccountAssumeRole"` | no |
| <a name="input_create_iam_roles"></a> [create\_iam\_roles](#input\_create\_iam\_roles) | Whether or not to create IAM roles. | `bool` | `true` | no |
| <a name="input_create_oidc_provider"></a> [create\_oidc\_provider](#input\_create\_oidc\_provider) | Whether or not to create the associated oidc provider. If true, variable 'oidc\_provider\_arn' is required | `bool` | `true` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | AWS IAM Detach Policies | `bool` | `true` | no |
| <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description) | AWS IAM Role Description | `string` | `"GitHub Organization Account Assume Role"` | no |
| <a name="input_iam_role_max_session_duration"></a> [iam\_role\_max\_session\_duration](#input\_iam\_role\_max\_session\_duration) | Max Session Duration in Seconds | `number` | `7200` | no |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | ARN of the github actions AWS oidc provider. Used if create\_oidc\_provider is true | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS Tags | `map(any)` | <pre>{<br>  "Country": "BR",<br>  "Environemnt": "dev",<br>  "Name": "github-actions-assume-role"<br>}</pre> | no |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_actions_assume_role_name"></a> [github\_actions\_assume\_role\_name](#output\_github\_actions\_assume\_role\_name) | GitHub Actions AssumeRole Name |
| <a name="output_github_actions_iam_policy"></a> [github\_actions\_iam\_policy](#output\_github\_actions\_iam\_policy) | n/a |
| <a name="output_github_actions_policy_data"></a> [github\_actions\_policy\_data](#output\_github\_actions\_policy\_data) | n/a |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | AWS IAM role |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the created IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of the created IAM role |
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Elio Severo Junior
