resource "github_app_installation_repository" "default" {
  for_each = var.installations

  repository      = var.repository
  installation_id = each.value
}
