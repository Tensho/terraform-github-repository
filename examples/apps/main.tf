# tflint-ignore: terraform_required_version
module "example_repository" {
  source = "../.."

  name        = "terraform-github-repository-apps-example"
  description = "Example repository with GitHub App access managed by Terraform"
  visibility  = "private"

  archive_on_destroy = false
}

module "example" {
  source = "../../modules/apps"

  repository = module.example_repository.name

  installations = {
    "ci" = "12345678"
  }
}
