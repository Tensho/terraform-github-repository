variable "repository" {
  description = "Repository name to grant access to."
  type        = string
}

variable "teams" {
  description = "Team slugs or IDs mapped to their permission: `pull`, `triage`, `push`, `maintain`, `admin` or a custom repository role name."
  type        = map(string)
  default     = {}
}

variable "users" {
  description = "Usernames mapped to their permission: `pull`, `triage`, `push`, `maintain`, `admin` or a custom repository role name."
  type        = map(string)
  default     = {}
}
