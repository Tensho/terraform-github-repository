# GitHub Repository Terraform Module

Terraform module to manage [GitHub](https://github.com) repository resources.

## Usage

```hcl
module "repository" {
  source  = "Tensho/repository/github"
  version = "~> 1.0"

  name        = "example"
  description = "Example repository managed by Terraform"
  visibility  = "public"

  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
}

module "rulesets" {
  source  = "Tensho/repository/github//modules/rulesets"
  version = "~> 1.0"

  repository = module.repository.name

  rulesets = {
    "default-branch" = {
      name = "Default Branch"

      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        }
      }

      rules = {
        deletion         = true
        non_fast_forward = true

        pull_request = {
          required_approving_review_count = 1
        }
      }
    }
  }
}
```

Check out comprehensive examples in [`examples`](./examples) folder.

## Features

* [x] [GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories)
* [x] [GitHub repository rulesets](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/about-rulesets)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for development setup and testing instructions.
