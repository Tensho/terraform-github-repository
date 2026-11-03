# GitHub Repository Terraform Module

Terraform module to manage [GitHub](https://github.com) repository resources.

## Usage

```hcl
module "repository" {
  source  = "Tensho/repository/github"
  version = "~> 1.0"

  name        = "example"
  description = "Example repository managed by Terraform"
  visibility  = "public"

  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
}

module "rulesets" {
  source  = "Tensho/repository/github//modules/rulesets"
  version = "~> 1.0"

  repository = module.repository.name

  rulesets = {
    "default-branch" = {
      name = "Default Branch"

      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        }
      }

      rules = {
        deletion         = true
        non_fast_forward = true

        pull_request = {
          required_approving_review_count = 1
        }
      }
    }
  }
}
```

Check out comprehensive examples in [`examples`](./examples) folder.

## Features

* [x] [Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories)
* [ ] [Collaborators & Teams](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/managing-teams-and-people-with-access-to-your-repository)
* [ ] [Branches](https://docs.github.com/en/pull-requests/reference/branches)
* [x] [Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)
* [ ] [Actions](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository)
* [ ] [Webhooks](https://docs.github.com/en/webhooks/about-webhooks)
* [ ] [Environments](https://docs.github.com/en/actions/how-tos/deploy/configure-and-manage-deployments/manage-environments)
* [ ] [Codespaces](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-development-environment-secrets-for-your-repository-or-organization)
* [ ] [Dependabot](https://docs.github.com/en/code-security/tutorials/secure-your-dependencies/dependabot-quickstart)
* [ ] [Deploy keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/managing-deploy-keys)
* [ ] [Autolink references](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/configuring-autolinks-to-reference-external-resources)
* [ ] [Labels](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/managing-labels)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for development setup and testing instructions.

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
| [github_repository.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | Allow auto-merging pull requests. | `bool` | `null` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Allow merge commits. | `bool` | `null` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Allow rebase merges. | `bool` | `null` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Allow squash merges. | `bool` | `null` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | Archive the repository instead of deleting it on destroy. | `bool` | `true` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Delete head branch after a pull request is merged. | `bool` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Repository description. | `string` | `null` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Enable GitHub Issues. | `bool` | `null` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Enable GitHub Projects. | `bool` | `null` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Enable GitHub Wiki. | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Repository name. | `string` | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Repository visibility: `public`, `private` or `internal`. | `string` | `"private"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | Repository full name (`owner/name`) |
| <a name="output_name"></a> [name](#output\_name) | Repository name |
| <a name="output_node_id"></a> [node\_id](#output\_node\_id) | Repository GraphQL node ID |
| <a name="output_repo_id"></a> [repo\_id](#output\_repo\_id) | Repository ID |
<!-- END_TF_DOCS -->
