resource "github_repository" "default" {
  name        = var.name
  description = var.description
  visibility  = var.visibility

  has_issues   = var.has_issues
  has_projects = var.has_projects
  has_wiki     = var.has_wiki

  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  allow_auto_merge       = var.allow_auto_merge
  allow_update_branch    = var.allow_update_branch
  delete_branch_on_merge = var.delete_branch_on_merge

  merge_commit_title          = var.merge_commit_title
  merge_commit_message        = var.merge_commit_message
  squash_merge_commit_title   = var.squash_merge_commit_title
  squash_merge_commit_message = var.squash_merge_commit_message

  archive_on_destroy = var.archive_on_destroy
}
