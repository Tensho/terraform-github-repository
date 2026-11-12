# AGENTS.md

Follow [CONTRIBUTING.md](CONTRIBUTING.md) instructions.

## Tests

Tests create real repositories under the `GITHUB_OWNER` account and destroy them afterwards.
Each test sets `archive_on_destroy = false`, so the repository gets deleted instead of archived.
Otherwise, the next run fails on the name collision with the archived repository.

Tests and examples run against the [pl-ay-gr-ou-nd](https://github.com/pl-ay-gr-ou-nd) sandbox organisation, not a personal account.
CI authenticates with a GitHub App installed on that organisation only, so a leaked token cannot reach other accounts.
