# tflint-ignore: terraform_required_version
module "example_repository" {
  source = "../.."

  name        = "terraform-github-repository-actions-example"
  description = "Example repository with GitHub Actions settings managed by Terraform"
  visibility  = "public"

  archive_on_destroy = false
}

module "example" {
  source = "../../modules/actions"

  repository = module.example_repository.name

  enabled              = true
  allowed_actions      = "selected"
  sha_pinning_required = true

  allowed_actions_config = {
    github_owned_allowed = true
    verified_allowed     = true
    patterns_allowed     = ["googleapis/release-please-action@*"]
  }

  # Let release-please open release pull requests.
  default_workflow_permissions     = "read"
  can_approve_pull_request_reviews = true
}
