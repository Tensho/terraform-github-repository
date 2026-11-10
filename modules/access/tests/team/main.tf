resource "github_team" "default" {
  name    = "terraform-github-repository-access-test"
  privacy = "closed"
}

output "slug" {
  value = github_team.default.slug
}
