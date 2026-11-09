variable "repository" {
  description = "Repository name to apply GitHub Actions settings to."
  type        = string
}

variable "enabled" {
  description = "Enable GitHub Actions."
  type        = bool
  default     = true
}

# Defaults match a new repository created in the UI.
variable "allowed_actions" {
  description = "Actions allowed to run: `all`, `local_only` or `selected`."
  type        = string
  default     = "all"
}

variable "allowed_actions_config" {
  description = "Actions allowed to run when `allowed_actions` is `selected`."

  type = object({
    github_owned_allowed = bool
    verified_allowed     = optional(bool)
    patterns_allowed     = optional(set(string))
  })

  default = null
}

variable "sha_pinning_required" {
  description = "Require actions and reusable workflows to be pinned to a full-length commit SHA."
  type        = bool
  default     = false
}

variable "default_workflow_permissions" {
  description = "Default `GITHUB_TOKEN` permissions: `read` or `write`."
  type        = string
  default     = "read"
}

variable "can_approve_pull_request_reviews" {
  description = "Allow GitHub Actions to create and approve pull requests."
  type        = bool
  default     = false
}
