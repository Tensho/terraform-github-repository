# tflint-ignore: terraform_required_version
module "example_repository" {
  source = "../.."

  name        = "terraform-github-repository-access-example"
  description = "Example repository with access managed by Terraform"
  visibility  = "private"

  archive_on_destroy = false
}

module "example_teams" {
  source  = "Tensho/organisation/github//modules/teams"
  version = "~> 1.1"

  teams = {
    "maintainers" = {
      name = "terraform-github-repository-access-example-maintainers"
    }

    "developers" = {
      name = "terraform-github-repository-access-example-developers"
    }
  }
}

module "example" {
  source = "../../modules/access"

  repository = module.example_repository.name

  teams = {
    (module.example_teams.team_slugs["maintainers"]) = "maintain"
    (module.example_teams.team_slugs["developers"])  = "push"
  }

  # GitHub usernames can't contain underscores, so this placeholder never invites a real user.
  users = {
    "github_username" = "triage"
  }
}
