# Actions

Manages GitHub Actions settings of a repository.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.13 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.13 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [github_actions_repository_permissions.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_repository_permissions) | resource |
| [github_workflow_repository_permissions.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/workflow_repository_permissions) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_allowed_actions"></a> [allowed\_actions](#input\_allowed\_actions) | Actions allowed to run: `all`, `local_only` or `selected`. | `string` | `"all"` | no |
| <a name="input_allowed_actions_config"></a> [allowed\_actions\_config](#input\_allowed\_actions\_config) | Actions allowed to run when `allowed_actions` is `selected`. | <pre>object({<br/>    github_owned_allowed = bool<br/>    verified_allowed     = optional(bool)<br/>    patterns_allowed     = optional(set(string))<br/>  })</pre> | `null` | no |
| <a name="input_can_approve_pull_request_reviews"></a> [can\_approve\_pull\_request\_reviews](#input\_can\_approve\_pull\_request\_reviews) | Allow GitHub Actions to create and approve pull requests. | `bool` | `false` | no |
| <a name="input_default_workflow_permissions"></a> [default\_workflow\_permissions](#input\_default\_workflow\_permissions) | Default `GITHUB_TOKEN` permissions: `read` or `write`. | `string` | `"read"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Enable GitHub Actions. | `bool` | `true` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository name to apply GitHub Actions settings to. | `string` | n/a | yes |
| <a name="input_sha_pinning_required"></a> [sha\_pinning\_required](#input\_sha\_pinning\_required) | Require actions and reusable workflows to be pinned to a full-length commit SHA. | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
