output "github_organization_id" {
  description = "The ID of the GitHub organization"
  value       = github_organization_settings.github_organization_settings.id
}

output "github_organization_owner" {
  description = "The owner of the GitHub organization"
  value       = "lupirex"
}

output "github_organization_teams_ids" {
  description = "List of the IDs of the GitHub Organization's teams"
  value       = [for team in github_team.github_organization_teams : team.id]
}

output "github_organization_teams_nodes_ids" {
  description = "List of the Nodes IDs of the GitHub Organization's teams"
  value       = [for team in github_team.github_organization_teams : team.node_id]
}

output "github_organization_teams_slugs" {
  description = "List of the slugs of the GitHub Organization's teams"
  value       = [for team in github_team.github_organization_teams : team.slug]
}
