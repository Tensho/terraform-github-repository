# Labels

Manages issue and pull request labels of a repository.

Labels are additive: the module manages only listed labels and ignores the rest, including the GitHub defaults. Listing an existing label, such as `bug`, adopts it.

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
| [github_issue_label.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_labels"></a> [labels](#input\_labels) | Label names mapped to their hex color without the leading `#` and an optional description. | <pre>map(object({<br/>    color       = string<br/>    description = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository name to manage labels in. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
