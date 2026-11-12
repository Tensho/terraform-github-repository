# Rulesets

Manages rulesets of a repository.

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
| [github_repository_ruleset.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_repository"></a> [repository](#input\_repository) | Repository name to apply rulesets to. | `string` | n/a | yes |
| <a name="input_rulesets"></a> [rulesets](#input\_rulesets) | Repository rulesets. | <pre>map(object({<br/>    name        = string<br/>    target      = optional(string, "branch")<br/>    enforcement = optional(string, "active")<br/><br/>    conditions = optional(object({<br/>      ref_name = object({<br/>        include = list(string)<br/>        exclude = optional(list(string), [])<br/>      })<br/>    }))<br/><br/>    bypass_actors = optional(list(object({<br/>      actor_id    = optional(number)<br/>      actor_type  = string<br/>      bypass_mode = optional(string, "always")<br/>    })), [])<br/><br/>    rules = object({<br/>      creation                = optional(bool)<br/>      update                  = optional(bool)<br/>      deletion                = optional(bool)<br/>      non_fast_forward        = optional(bool)<br/>      required_linear_history = optional(bool)<br/>      required_signatures     = optional(bool)<br/><br/>      pull_request = optional(object({<br/>        allowed_merge_methods             = optional(list(string))<br/>        dismiss_stale_reviews_on_push     = optional(bool)<br/>        require_code_owner_review         = optional(bool)<br/>        require_last_push_approval        = optional(bool)<br/>        required_approving_review_count   = optional(number)<br/>        required_review_thread_resolution = optional(bool)<br/>      }))<br/><br/>      required_status_checks = optional(object({<br/>        strict_required_status_checks_policy = optional(bool)<br/>        do_not_enforce_on_create             = optional(bool)<br/><br/>        required_checks = list(object({<br/>          context        = string<br/>          integration_id = optional(number)<br/>        }))<br/>      }))<br/>    })<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_ruleset_ids"></a> [ruleset\_ids](#output\_ruleset\_ids) | Ruleset IDs. |
<!-- END_TF_DOCS -->
