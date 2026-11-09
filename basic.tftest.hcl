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
    # Keep visibility unchanged: GitHub applies visibility changes
    # asynchronously, and teardown DELETE fails with 409 while one is running.
    visibility = "private"

    has_issues   = true
    has_projects = true
    has_wiki     = false

    allow_merge_commit     = false
    allow_squash_merge     = true
    allow_rebase_merge     = true
    allow_auto_merge       = true
    allow_update_branch    = true
    delete_branch_on_merge = true

    merge_commit_title          = "PR_TITLE"
    merge_commit_message        = "PR_BODY"
    squash_merge_commit_title   = "PR_TITLE"
    squash_merge_commit_message = "COMMIT_MESSAGES"
  }

  assert {
    condition     = github_repository.default.description == "Terraform GitHub repository module test"
    error_message = "Repository description has not been updated"
  }

  assert {
    condition     = github_repository.default.allow_merge_commit == false
    error_message = "Repository merge commits have not been disabled"
  }

  assert {
    condition     = github_repository.default.delete_branch_on_merge == true
    error_message = "Repository head branch deletion on merge has not been enabled"
  }

  assert {
    condition     = github_repository.default.allow_update_branch == true
    error_message = "Repository branch update suggestion has not been enabled"
  }

  assert {
    condition     = github_repository.default.squash_merge_commit_title == "PR_TITLE"
    error_message = "Repository squash merge commit title has not been updated"
  }
}
