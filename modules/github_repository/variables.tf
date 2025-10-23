variable "repository_name" {
  description = "Name of the repository to be created"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
  default     = ""
}

variable "gitignore_template" {
  description = "Gitignore template to use for the repository (e.g. 'Haskell')"
  type        = string
  default     = null
}

variable "topics" {
  description = "List of topics of the repository (e.g. ['Terraform', 'Python', 'GenAI', 'Traditional ML'])"
  type        = list(string)
  default     = null
}

variable "codeowners" {
  description = "String of CODEOWNERS for the repository (e.g. 'codeowner #1, codeowner #2 and codeowner #3' or 'the codeowners team', etc.)"
  type        = string
  default     = "Luís Pires"
}

variable "github_token" {
  description = "GitHub Personal Access Token value"
  type        = string
  sensitive   = true
}
