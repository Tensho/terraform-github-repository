# tflint-ignore: terraform_required_version
module "example" {
  source = "../.."

  name         = "terraform-github-repository-example"
  description  = "Example repository managed by Terraform"
  homepage_url = "https://registry.terraform.io/modules/Tensho/repository/github"
  topics       = ["terraform", "example"]
  visibility   = "public"

  is_template = false
  archived    = false

  has_issues      = true
  has_discussions = false
  has_projects    = false
  has_wiki        = false

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

  # Public repositories always have advanced security, so it cannot be supplied.
  security_and_analysis = {
    secret_scanning                 = "enabled"
    secret_scanning_push_protection = "enabled"
  }

  archive_on_destroy = false
}
