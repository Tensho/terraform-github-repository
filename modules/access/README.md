# Access

Grants teams and users access to a repository.

Access is additive: the module manages only listed teams and users and ignores the rest.

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
| [github_repository_collaborator.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator) | resource |
| [github_team_repository.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository name to grant access to. | `string` | n/a | yes |
| <a name="input_teams"></a> [teams](#input\_teams) | Team slugs or IDs mapped to their permission: `pull`, `triage`, `push`, `maintain`, `admin` or a custom repository role name. | `map(string)` | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | Usernames mapped to their permission: `pull`, `triage`, `push`, `maintain`, `admin` or a custom repository role name. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
