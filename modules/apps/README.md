# Apps

Grants GitHub App installations access to a repository.

Access is additive: the module manages only listed installations and ignores the rest. The installation must use "Only select repositories" access.

> [!IMPORTANT]
> GitHub serves this API to user tokens only. Authenticate the provider with a personal access token of a user with admin access to the repository, not with a GitHub App installation token.

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
| [github_app_installation_repository.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_installations"></a> [installations](#input\_installations) | Arbitrary GitHub App names mapped to their installation IDs. | `map(string)` | `{}` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository name to grant GitHub App installations access to. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
