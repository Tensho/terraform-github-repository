# Contributing

This project uses [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/).

## Prerequisites

```shell
mise install
prek install
tflint --init
```

### Provider Authentication

Fetch secrets from 1Password with [fnox](https://github.com/jdx/fnox) (see `fnox.local.toml`):

```shell
fnox exec -- terraform test
```

Or export them manually:

```shell
export GITHUB_OWNER=<REDACTED>
export GITHUB_TOKEN=<REDACTED>
```

Use a [fine-grained personal access token](https://github.com/settings/personal-access-tokens) with:

* **Repository access**: All repositories (required to create new repositories)
* **Repository permissions** → **Administration**: Read and write (create, delete, rulesets)
* **Repository permissions** → **Issues**: Read and write (labels)
* **Organization permissions** → **Members**: Read and write (test teams)

The `apps` sub-module calls a GitHub API that serves user tokens only, so use a personal access token, not a GitHub App installation token.

## Testing

Run the root module test suite:

```shell
terraform init
terraform test -verbose
```

Run a sub-module test suite:

```shell
cd modules/access
terraform init
terraform test -verbose
```

```shell
cd modules/actions
terraform init
terraform test -verbose
```

The `apps` test suite needs the ID of a GitHub App installation in `GITHUB_OWNER` with "Only select repositories" access:

```shell
cd modules/apps
terraform init
terraform test -verbose -var installation_id=<REDACTED>
```

```shell
cd modules/labels
terraform init
terraform test -verbose
```

```shell
cd modules/rulesets
terraform init
terraform test -verbose
```
