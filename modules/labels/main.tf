resource "github_issue_label" "default" {
  for_each = var.labels

  repository  = var.repository
  name        = each.key
  color       = each.value.color
  description = each.value.description
}
