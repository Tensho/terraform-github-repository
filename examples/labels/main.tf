# tflint-ignore: terraform_required_version
module "example_repository" {
  source = "../.."

  name        = "terraform-github-repository-labels-example"
  description = "Example repository with labels managed by Terraform"
  visibility  = "private"

  archive_on_destroy = false
}

module "example" {
  source = "../../modules/labels"

  repository = module.example_repository.name

  labels = {
    "dependencies" = {
      color       = "0366d6"
      description = "Pull requests that update a dependency file"
    }

    "terraform" = {
      color = "7b42bc"
    }
  }
}
