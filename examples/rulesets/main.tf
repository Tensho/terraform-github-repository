# tflint-ignore: terraform_required_version
module "example_repository" {
  source = "../.."

  name        = "terraform-github-repository-rulesets-example"
  description = "Example repository with rulesets managed by Terraform"
  visibility  = "public"

  archive_on_destroy = false
}

module "example" {
  source = "../../modules/rulesets"

  repository = module.example_repository.name

  rulesets = {
    "default-branch" = {
      name = "Default Branch"

      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        }
      }

      bypass_actors = [
        {
          actor_type  = "OrganizationAdmin"
          bypass_mode = "always"
        },
      ]

      rules = {
        deletion                = true
        non_fast_forward        = true
        required_linear_history = true

        pull_request = {
          allowed_merge_methods             = ["squash", "rebase"]
          dismiss_stale_reviews_on_push     = true
          required_approving_review_count   = 1
          required_review_thread_resolution = true
        }

        required_status_checks = {
          strict_required_status_checks_policy = true

          required_checks = [
            {
              context = "Lint"
            },
            {
              context = "Test"
            },
          ]
        }
      }
    }

    "release-tags" = {
      name   = "Release Tags"
      target = "tag"

      conditions = {
        ref_name = {
          include = ["refs/tags/v*"]
        }
      }

      rules = {
        update   = true
        deletion = true
      }
    }
  }
}
