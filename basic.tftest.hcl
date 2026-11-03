variables {
  archive_on_destroy = false
}

run "required_attributes" {
  variables {
    name = "terraform-github-repository-test"
  }

  assert {
    condition     = github_repository.default.name == "terraform-github-repository-test"
    error_message = "Repository has not been created"
  }

  assert {
    condition     = github_repository.default.visibility == "private"
    error_message = "Repository visibility is not 'private' by default"
  }
}

run "all_attributes" {
  variables {
    name        = "terraform-github-repository-test"
    description = "Terraform GitHub repository module test"
    visibility  = "public"

    has_issues   = true
    has_projects = true
    has_wiki     = false

    allow_merge_commit     = false
    allow_squash_merge     = true
    allow_rebase_merge     = true
    allow_auto_merge       = true
    delete_branch_on_merge = true
  }

  assert {
    condition     = github_repository.default.description == "Terraform GitHub repository module test"
    error_message = "Repository description has not been updated"
  }

  assert {
    condition     = github_repository.default.visibility == "public"
    error_message = "Repository visibility has not been updated"
  }

  assert {
    condition     = github_repository.default.allow_merge_commit == false
    error_message = "Repository merge commits have not been disabled"
  }

  assert {
    condition     = github_repository.default.delete_branch_on_merge == true
    error_message = "Repository head branch deletion on merge has not been enabled"
  }
}
