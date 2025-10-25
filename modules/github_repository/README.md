# GitHub Repository Terraform Module

This Terraform module creates and configures a GitHub repository and adds common repository files (README, CODEOWNERS, LICENSE) and repository settings.

## Features

- Creates a GitHub repository with description, topics and gitignore template
- Adds README.md, .github/CODEOWNERS and .github/LICENSE
- Enables repository security features and vulnerability alerts
- Configures common repository settings (issues, discussions, wiki, branch merge preferences)

## Usage

```hcl
terraform {
  required_version = ">= 1.13.4"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.GITHUB_TOKEN
  owner = "GitHub Organization"
}

module "github_repository" {
  source             = "git::https://github.com/Investments-Assistant/terraform-modules//modules/github_repository?ref=main"
  repository_name    = "repository-name"
  gtihub_token       = var.GITHUB_TOKEN
  description        = "Description of the repository"
  gitignore_template = "gitignoreTemplate"
  topics             = ["Topic #1", "Topic #2"]
  codeowners         = "codeowner #1, codeowner #2 and codeowner #3"
}
```

## Variables

| Name                | Type          | Description                                                                                 | Required |
|---------------------|---------------|---------------------------------------------------------------------------------------------|----------|
| repository_name     | string        | Name of the repository to be created                                                        | yes      |
| github_token        | string        | GitHub Personal Access Token                                                                | yes      |
| description         | string        | Description of the repository                                                               | no       |
| gitignore_template  | string        | Gitignore template to use for the repository (e.g. 'Haskell')                               | no       |
| topics              | list(string)  | List of topics of the repository (e.g. ['Terraform', 'Python', 'GenAI', 'Traditional ML'])  | no       |
| codeowners          | string        | Content for .github/CODEOWNERS file                                                         | no       |

## Outputs

- This module does not currently expose explicit outputs. You can reference created resources directly (e.g. 'github_repository.terraform_modules.name').

## Providers

- [integrations/github](https://registry.terraform.io/providers/integrations/github/latest)

## Notes

- Ensure your GitHub token has repo and admin:org scopes.
- Adjust the GitHub provider configuration and permission scopes according to your organization and environment.
