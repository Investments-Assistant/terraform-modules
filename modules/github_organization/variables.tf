variable "billing_email" {
  description = "The billing email for the GitHub organization"
  type        = string
  default     = "lu15.p1r35.1996@gmail.com"
}

variable "organization_name" {
  description = "The name of the GitHub organization"
  type        = string
}

variable "description" {
  description = "The description of the GitHub organization"
  type        = string
  default     = null
}

variable "usernames" {
  description = "List of GitHub users to be added to the organization"
  type        = list(string)
}

variable "organization_teams" {
  description = "Map of team names to their descriptions"
  type        = map(string)
  default     = null
}
