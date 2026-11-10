run "setup_repository" {
  module {
    source = "../.."
  }

  variables {
    name               = "terraform-github-repository-access-test"
    archive_on_destroy = false
  }
}

run "setup_team" {
  module {
    source  = "Tensho/organisation/github//modules/teams"
    version = "1.1.0"
  }

  variables {
    teams = {
      "access-test" = {
        name = "terraform-github-repository-access-test"
      }
    }
  }
}

run "required_attributes" {
  variables {
    repository = run.setup_repository.name
  }

  assert {
    condition     = length(github_team_repository.default) == 0 && length(github_repository_collaborator.default) == 0
    error_message = "Access has been granted without teams or users"
  }
}

run "all_attributes" {
  variables {
    repository = run.setup_repository.name

    teams = {
      (run.setup_team.team_slugs["access-test"]) = "maintain"
    }

    users = {
      "Tensho" = "admin"
    }
  }

  assert {
    condition     = github_team_repository.default[run.setup_team.team_slugs["access-test"]].permission == "maintain"
    error_message = "Team access has not been granted"
  }

  assert {
    condition     = github_repository_collaborator.default["Tensho"].permission == "admin"
    error_message = "User access has not been granted"
  }
}
