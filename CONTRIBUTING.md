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

## Testing

Run the root module test suite:

```shell
terraform init
terraform test -verbose
```

Run the sub-module test suite:

```shell
cd modules/rulesets
terraform init
terraform test -verbose
```
