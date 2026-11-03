output "name" {
  description = "Repository name"
  value       = github_repository.default.name
}

output "full_name" {
  description = "Repository full name (`owner/name`)"
  value       = github_repository.default.full_name
}

output "repo_id" {
  description = "Repository ID"
  value       = github_repository.default.repo_id
}

output "node_id" {
  description = "Repository GraphQL node ID"
  value       = github_repository.default.node_id
}
