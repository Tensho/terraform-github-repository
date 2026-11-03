output "ruleset_ids" {
  description = "Ruleset IDs"

  value = {
    for ruleset_key, ruleset in github_repository_ruleset.default : ruleset_key => ruleset.ruleset_id
  }
}
