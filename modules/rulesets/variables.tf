variable "repository" {
  description = "Repository name to apply rulesets to."
  type        = string
}

variable "rulesets" {
  description = "Repository rulesets."

  type = map(object({
    name        = string
    target      = optional(string, "branch")
    enforcement = optional(string, "active")

    conditions = optional(object({
      ref_name = object({
        include = list(string)
        exclude = optional(list(string), [])
      })
    }))

    bypass_actors = optional(list(object({
      actor_id    = optional(number)
      actor_type  = string
      bypass_mode = optional(string, "always")
    })), [])

    rules = object({
      creation                = optional(bool)
      update                  = optional(bool)
      deletion                = optional(bool)
      non_fast_forward        = optional(bool)
      required_linear_history = optional(bool)
      required_signatures     = optional(bool)

      pull_request = optional(object({
        allowed_merge_methods             = optional(list(string))
        dismiss_stale_reviews_on_push     = optional(bool)
        require_code_owner_review         = optional(bool)
        require_last_push_approval        = optional(bool)
        required_approving_review_count   = optional(number)
        required_review_thread_resolution = optional(bool)
      }))

      required_status_checks = optional(object({
        strict_required_status_checks_policy = optional(bool)
        do_not_enforce_on_create             = optional(bool)

        required_checks = list(object({
          context        = string
          integration_id = optional(number)
        }))
      }))
    })
  }))

  default = {}
}
