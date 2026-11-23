variable "repository" {
  description = "Repository name to grant GitHub App installations access to."
  type        = string
}

variable "installations" {
  description = "Arbitrary GitHub App names mapped to their installation IDs."
  type        = map(string)
  default     = {}
}
