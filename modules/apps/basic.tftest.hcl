run "setup_repository" {
  module {
    source = "../.."
  }

  variables {
    name               = "terraform-github-repository-apps-test"
    archive_on_destroy = false
  }
}

run "required_attributes" {
  variables {
    repository = run.setup_repository.name
  }

  assert {
    condition     = length(github_app_installation_repository.default) == 0
    error_message = "Access has been granted without installations"
  }
}

run "all_attributes" {
  variables {
    repository = run.setup_repository.name

    installations = {
      "test" = var.installation_id
    }
  }

  assert {
    condition     = github_app_installation_repository.default["test"].installation_id == var.installation_id
    error_message = "Installation access has not been granted"
  }
}
