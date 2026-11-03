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

variable "delete_branch_on_merge" {
  description = "Delete head branch after a pull request is merged."
  type        = bool
  default     = null
}

variable "archive_on_destroy" {
  description = "Archive the repository instead of deleting it on destroy."
  type        = bool
  default     = true
}
