resource "github_repository" "default" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url
  topics       = var.topics
  visibility   = var.visibility

  is_template = var.is_template
  archived    = var.archived

  has_issues      = var.has_issues
  has_discussions = var.has_discussions
  has_projects    = var.has_projects
  has_wiki        = var.has_wiki

  allow_forking          = var.allow_forking
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

  web_commit_signoff_required = var.web_commit_signoff_required

  dynamic "security_and_analysis" {
    for_each = var.security_and_analysis[*]

    content {
      dynamic "advanced_security" {
        for_each = security_and_analysis.value.advanced_security[*]

        content {
          status = advanced_security.value
        }
      }

      dynamic "code_security" {
        for_each = security_and_analysis.value.code_security[*]

        content {
          status = code_security.value
        }
      }

      dynamic "secret_scanning" {
        for_each = security_and_analysis.value.secret_scanning[*]

        content {
          status = secret_scanning.value
        }
      }

      dynamic "secret_scanning_ai_detection" {
        for_each = security_and_analysis.value.secret_scanning_ai_detection[*]

        content {
          status = secret_scanning_ai_detection.value
        }
      }

      dynamic "secret_scanning_non_provider_patterns" {
        for_each = security_and_analysis.value.secret_scanning_non_provider_patterns[*]

        content {
          status = secret_scanning_non_provider_patterns.value
        }
      }

      dynamic "secret_scanning_push_protection" {
        for_each = security_and_analysis.value.secret_scanning_push_protection[*]

        content {
          status = secret_scanning_push_protection.value
        }
      }
    }
  }

  archive_on_destroy = var.archive_on_destroy
}
