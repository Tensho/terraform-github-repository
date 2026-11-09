variable "name" {
  description = "Repository name."
  type        = string
}

variable "description" {
  description = "Repository description."
  type        = string
  default     = null
}

variable "homepage_url" {
  description = "URL of a page describing the repository."
  type        = string
  default     = null
}

variable "topics" {
  description = "Repository topics."
  type        = set(string)
  default     = null
}

variable "visibility" {
  description = "Repository visibility: `public`, `private` or `internal`."
  type        = string
  default     = "private"
}

variable "is_template" {
  description = "Mark the repository as a template."
  type        = bool
  default     = null
}

variable "archived" {
  description = "Archive the repository. Archived repositories are read-only."
  type        = bool
  default     = null
}

variable "has_issues" {
  description = "Enable GitHub Issues."
  type        = bool
  default     = null
}

variable "has_discussions" {
  description = "Enable GitHub Discussions."
  type        = bool
  default     = null
}

variable "has_projects" {
  description = "Enable GitHub Projects."
  type        = bool
  default     = null
}

variable "has_wiki" {
  description = "Enable GitHub Wiki."
  type        = bool
  default     = null
}

variable "allow_forking" {
  description = "Allow private forking. Applies only to private and internal repositories."
  type        = bool
  default     = null
}

variable "allow_merge_commit" {
  description = "Allow merge commits."
  type        = bool
  default     = null
}

variable "allow_squash_merge" {
  description = "Allow squash merges."
  type        = bool
  default     = null
}

variable "allow_rebase_merge" {
  description = "Allow rebase merges."
  type        = bool
  default     = null
}

variable "allow_auto_merge" {
  description = "Allow auto-merging pull requests."
  type        = bool
  default     = null
}

variable "allow_update_branch" {
  description = "Always suggest updating pull request branches."
  type        = bool
  default     = null
}

variable "delete_branch_on_merge" {
  description = "Delete head branch after a pull request is merged."
  type        = bool
  default     = null
}

variable "merge_commit_title" {
  description = "Default merge commit title: `PR_TITLE` or `MERGE_MESSAGE`."
  type        = string
  default     = null
}

variable "merge_commit_message" {
  description = "Default merge commit message: `PR_BODY`, `PR_TITLE` or `BLANK`."
  type        = string
  default     = null
}

variable "squash_merge_commit_title" {
  description = "Default squash merge commit title: `PR_TITLE` or `COMMIT_OR_PR_TITLE`."
  type        = string
  default     = null
}

variable "squash_merge_commit_message" {
  description = "Default squash merge commit message: `PR_BODY`, `COMMIT_MESSAGES` or `BLANK`."
  type        = string
  default     = null
}

variable "web_commit_signoff_required" {
  description = "Require contributors to sign off on web-based commits."
  type        = bool
  default     = null
}

variable "security_and_analysis" {
  description = "Security and analysis feature statuses: `enabled` or `disabled`. Omitted features keep their current status."
  type = object({
    advanced_security                     = optional(string)
    code_security                         = optional(string)
    secret_scanning                       = optional(string)
    secret_scanning_ai_detection          = optional(string)
    secret_scanning_non_provider_patterns = optional(string)
    secret_scanning_push_protection       = optional(string)
  })
  default = null
}

variable "archive_on_destroy" {
  description = "Archive the repository instead of deleting it on destroy."
  type        = bool
  default     = true
}
