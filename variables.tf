variable "name" {
  description = "Repository name."
  type        = string
}

variable "description" {
  description = "Repository description."
  type        = string
  default     = null
}

variable "visibility" {
  description = "Repository visibility: `public`, `private` or `internal`."
  type        = string
  default     = "private"
}

variable "has_issues" {
  description = "Enable GitHub Issues."
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

variable "archive_on_destroy" {
  description = "Archive the repository instead of deleting it on destroy."
  type        = bool
  default     = true
}
