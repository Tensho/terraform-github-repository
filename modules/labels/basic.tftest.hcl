run "setup_repository" {
  module {
    source = "../.."
  }

  variables {
    name               = "terraform-github-repository-labels-test"
    archive_on_destroy = false
  }
}

run "required_attributes" {
  variables {
    repository = run.setup_repository.name

    labels = {
      "required-attributes" = {
        color = "ededed"
      }
    }
  }

  assert {
    condition     = github_issue_label.default["required-attributes"].color == "ededed"
    error_message = "Label 'required-attributes' has not been created"
  }
}

run "all_attributes" {
  variables {
    repository = run.setup_repository.name

    labels = {
      "all-attributes" = {
        color       = "0e8a16"
        description = "Terraform GitHub repository module test"
      }
    }
  }

  assert {
    condition     = github_issue_label.default["all-attributes"].description == "Terraform GitHub repository module test"
    error_message = "Label 'all-attributes' has not been created"
  }
}
