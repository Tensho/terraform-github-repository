# tflint-ignore: terraform_required_version
module "example" {
  source = "../.."

  name        = "terraform-github-repository-example"
  description = "Example repository managed by Terraform"
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = true
  allow_auto_merge       = true
  delete_branch_on_merge = true

  archive_on_destroy = false
}
