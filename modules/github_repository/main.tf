resource "github_repository" "repository" {
  name                   = var.repository_name
  description            = var.description
  gitignore_template     = var.gitignore_template
  topics                 = var.topics
  has_issues             = true
  has_discussions        = true
  has_wiki               = true
  allow_merge_commit     = false
  allow_rebase_merge     = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
  allow_update_branch    = true
  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

# resource "github_branch_protection" "main_branch_protection" {
# }

resource "github_repository_file" "code_of_conduct" {
  repository = github_repository.repository.name
  file       = "CODE_OF_CONDUCT"
  content    = file("${path.module}/files_templates/CODE_OF_CONDUCT_template")
}

resource "github_repository_file" "codeowners" {
  repository = github_repository.repository.name
  file       = "CODEOWNERS"
  content = templatefile("${path.module}/files_templates/CODEOWNERS_template", {
    codeowners = var.codeowners
  })
}

resource "github_repository_file" "contributing" {
  repository = github_repository.repository.name
  file       = "CONTRIBUTING"
  content = file("${path.module}/files_templates/CONTRIBUTING_template")
}

resource "github_repository_file" "gitignore" {
  repository = github_repository.repository.name
  file       = ".gitignore"
  content    = file("${path.module}/files_templates/gitignore_template")
}

resource "github_repository_file" "license" {
  repository = github_repository.repository.name
  file       = "LICENSE"
  content    = file("${path.module}/files_templates/LICENSE_template")
}

resource "github_repository_file" "readme" {
  repository = github_repository.repository.name
  file       = "README.md"
  content = templatefile("${path.module}/files_templates/README_template", {
    repository_name = var.repository_name
    description     = var.description
  })
}
