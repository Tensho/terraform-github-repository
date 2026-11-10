# tflint-ignore: terraform_required_version
module "example_repository" {
  source = "../.."

  name        = "terraform-github-repository-access-example"
  description = "Example repository with access managed by Terraform"
  visibility  = "private"

  archive_on_destroy = false
}

module "example" {
  source = "../../modules/access"

  repository = module.example_repository.name

  teams = {
    "maintainers" = "maintain"
    "developers"  = "push"
  }

  users = {
    "octocat" = "triage"
  }
}
