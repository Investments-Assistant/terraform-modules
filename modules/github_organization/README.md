# GitHub Organization Terraform Module

This Terraform module creates a GitHub organization..

## Features

- Configure organization settings (name, billing email, description, permissions)
- Add organization members
- Create multiple teams with custom descriptions

## Usage

```hcl
module "github_organization" {
  source = "./modules/github_organization"
  billing_email       = "admin@example.com"
  organization_name   = "my-org"
  description         = "My organization description"
  usernames           = ["user1", "user2"]
  organization_teams  = {
    "devs"  = "Developers team"
    "ops"   = "Operations team"
  }
}
```

## Variables

| Name                | Type            | Description                                 | Required |
|---------------------|-----------------|---------------------------------------------|----------|
| billing_email       | string          | Billing email for the organization          | yes      |
| organization_name   | string          | Name of the GitHub organization             | yes      |
| description         | string          | Description of the organization             | no       |
| usernames           | list(string)    | List of usernames to add as members         | yes      |
| organization_teams  | map(string)     | Map of team names to descriptions           | no       |

## Outputs

| Name                                  | Description                                              |
|-------------------------------------- |----------------------------------------------------------|
| github_organization_id                | The ID of the GitHub organization                        |
| github_organization_owner             | The owner of the GitHub organization                     |
| github_organization_teams_ids         | List of the IDs of the GitHub Organization's teams       |
| github_organization_teams_nodes_ids   | List of the Node IDs of the GitHub Organization's teams  |
| github_organization_teams_slugs       | List of the slugs of the GitHub Organization's teams     |

## Providers

- [integrations/github](https://registry.terraform.io/providers/integrations/github/latest)

## Notes

- Ensure your GitHub token has admin:org and repo scope.
- Ensure your GitHub token has repo and admin:org scopes.
- Adjust the GitHub provider configuration and permission scopes according to your organization and environment.
