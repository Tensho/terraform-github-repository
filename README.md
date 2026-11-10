# GitHub Repository Terraform Module

Terraform module to manage [GitHub](https://github.com) repository resources.

## Usage

```hcl
module "repository" {
  source  = "Tensho/repository/github"
  version = "~> 1.3"

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

> [!NOTE]
> This module covers repository-scoped resources only.
> Organisation-scoped resources live in [terraform-github-organisation](https://github.com/Tensho/terraform-github-organisation).

* [x] [Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories)
* [x] [Collaborators & Teams](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/managing-teams-and-people-with-access-to-your-repository)
* [ ] [Branches](https://docs.github.com/en/pull-requests/reference/branches)
* [x] [Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)
* [x] [Actions](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository)
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
| <a name="input_allow_forking"></a> [allow\_forking](#input\_allow\_forking) | Allow private forking. Applies only to private and internal repositories. | `bool` | `null` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Allow merge commits. | `bool` | `null` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Allow rebase merges. | `bool` | `null` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Allow squash merges. | `bool` | `null` | no |
| <a name="input_allow_update_branch"></a> [allow\_update\_branch](#input\_allow\_update\_branch) | Always suggest updating pull request branches. | `bool` | `null` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | Archive the repository instead of deleting it on destroy. | `bool` | `true` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Archive the repository. Archived repositories are read-only. | `bool` | `null` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Delete head branch after a pull request is merged. | `bool` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Repository description. | `string` | `null` | no |
| <a name="input_has_discussions"></a> [has\_discussions](#input\_has\_discussions) | Enable GitHub Discussions. | `bool` | `null` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Enable GitHub Issues. | `bool` | `null` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Enable GitHub Projects. | `bool` | `null` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Enable GitHub Wiki. | `bool` | `null` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | URL of a page describing the repository. | `string` | `null` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Mark the repository as a template. | `bool` | `null` | no |
| <a name="input_merge_commit_message"></a> [merge\_commit\_message](#input\_merge\_commit\_message) | Default merge commit message: `PR_BODY`, `PR_TITLE` or `BLANK`. | `string` | `null` | no |
| <a name="input_merge_commit_title"></a> [merge\_commit\_title](#input\_merge\_commit\_title) | Default merge commit title: `PR_TITLE` or `MERGE_MESSAGE`. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Repository name. | `string` | n/a | yes |
| <a name="input_security_and_analysis"></a> [security\_and\_analysis](#input\_security\_and\_analysis) | Security and analysis feature statuses: `enabled` or `disabled`. Omitted features keep their current status. | <pre>object({<br/>    advanced_security                     = optional(string)<br/>    code_security                         = optional(string)<br/>    secret_scanning                       = optional(string)<br/>    secret_scanning_ai_detection          = optional(string)<br/>    secret_scanning_non_provider_patterns = optional(string)<br/>    secret_scanning_push_protection       = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_squash_merge_commit_message"></a> [squash\_merge\_commit\_message](#input\_squash\_merge\_commit\_message) | Default squash merge commit message: `PR_BODY`, `COMMIT_MESSAGES` or `BLANK`. | `string` | `null` | no |
| <a name="input_squash_merge_commit_title"></a> [squash\_merge\_commit\_title](#input\_squash\_merge\_commit\_title) | Default squash merge commit title: `PR_TITLE` or `COMMIT_OR_PR_TITLE`. | `string` | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | Repository topics. | `set(string)` | `null` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Repository visibility: `public`, `private` or `internal`. | `string` | `"private"` | no |
| <a name="input_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#input\_web\_commit\_signoff\_required) | Require contributors to sign off on web-based commits. | `bool` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | Repository full name (`owner/name`) |
| <a name="output_name"></a> [name](#output\_name) | Repository name |
| <a name="output_node_id"></a> [node\_id](#output\_node\_id) | Repository GraphQL node ID |
| <a name="output_repo_id"></a> [repo\_id](#output\_repo\_id) | Repository ID |
<!-- END_TF_DOCS -->
