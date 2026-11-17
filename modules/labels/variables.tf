variable "repository" {
  description = "Repository name to manage labels in."
  type        = string
}

variable "labels" {
  description = "Label names mapped to their hex color without the leading `#` and an optional description."
  type = map(object({
    color       = string
    description = optional(string)
  }))
  default = {}
}
