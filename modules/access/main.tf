resource "github_team_repository" "default" {
  for_each = var.teams

  repository = var.repository
  team_id    = each.key
  permission = each.value
}

resource "github_repository_collaborator" "default" {
  for_each = var.users

  repository = var.repository
  username   = each.key
  permission = each.value
}
