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
    name         = "terraform-github-repository-test"
    description  = "Terraform GitHub repository module test"
    homepage_url = "https://registry.terraform.io/modules/Tensho/repository/github"
    topics       = ["terraform", "test"]
    # Keep visibility unchanged: GitHub applies visibility changes
    # asynchronously, and teardown DELETE fails with 409 while one is running.
    visibility = "private"

    is_template = true
    archived    = false

    has_issues      = true
    has_discussions = true
    has_projects    = true
    has_wiki        = false

    allow_forking          = false
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

    web_commit_signoff_required = true

    security_and_analysis = {
      secret_scanning                 = "disabled"
      secret_scanning_push_protection = "disabled"
    }
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

  assert {
    condition     = github_repository.default.topics == toset(["terraform", "test"])
    error_message = "Repository topics have not been updated"
  }

  assert {
    condition     = github_repository.default.has_discussions == true
    error_message = "Repository discussions have not been enabled"
  }

  assert {
    condition     = github_repository.default.is_template == true
    error_message = "Repository has not been marked as a template"
  }

  assert {
    condition     = github_repository.default.web_commit_signoff_required == true
    error_message = "Repository web commit sign-off has not been required"
  }
}
