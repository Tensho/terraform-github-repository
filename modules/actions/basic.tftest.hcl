run "setup_repository" {
  module {
    source = "../.."
  }

  variables {
    name               = "terraform-github-repository-actions-test"
    visibility         = "public"
    archive_on_destroy = false
  }
}

run "required_attributes" {
  variables {
    repository = run.setup_repository.name
  }

  assert {
    condition     = github_actions_repository_permissions.default.repository == run.setup_repository.name
    error_message = "Actions permissions have not been created"
  }

  assert {
    condition     = github_actions_repository_permissions.default.allowed_actions == "all"
    error_message = "Allowed actions are not 'all' by default"
  }

  assert {
    condition     = github_actions_repository_permissions.default.sha_pinning_required == false
    error_message = "SHA pinning is required by default"
  }

  assert {
    condition     = github_workflow_repository_permissions.default.default_workflow_permissions == "read"
    error_message = "Default workflow permissions are not 'read' by default"
  }

  assert {
    condition     = github_workflow_repository_permissions.default.can_approve_pull_request_reviews == false
    error_message = "GitHub Actions are allowed to create and approve pull requests by default"
  }
}

run "all_attributes" {
  variables {
    repository = run.setup_repository.name

    enabled              = true
    allowed_actions      = "selected"
    sha_pinning_required = true

    allowed_actions_config = {
      github_owned_allowed = true
      verified_allowed     = false
      patterns_allowed     = ["hashicorp/setup-terraform@*"]
    }

    default_workflow_permissions     = "write"
    can_approve_pull_request_reviews = true
  }

  assert {
    condition     = github_actions_repository_permissions.default.allowed_actions == "selected"
    error_message = "Allowed actions have not been restricted"
  }

  assert {
    condition     = github_actions_repository_permissions.default.sha_pinning_required == true
    error_message = "SHA pinning has not been required"
  }

  assert {
    condition     = github_actions_repository_permissions.default.allowed_actions_config[0].patterns_allowed == toset(["hashicorp/setup-terraform@*"])
    error_message = "Allowed action patterns have not been updated"
  }

  assert {
    condition     = github_workflow_repository_permissions.default.default_workflow_permissions == "write"
    error_message = "Default workflow permissions have not been updated"
  }

  assert {
    condition     = github_workflow_repository_permissions.default.can_approve_pull_request_reviews == true
    error_message = "GitHub Actions have not been allowed to create and approve pull requests"
  }
}
