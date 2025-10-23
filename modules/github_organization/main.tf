resource "github_organization_settings" "github_organization_settings" {
  billing_email                            = var.billing_email
  name                                     = var.organization_name
  description                              = var.description
  default_repository_permission            = "none"
  members_can_create_repositories          = false
  members_can_create_public_repositories   = false
  members_can_create_private_repositories  = false
  members_can_create_internal_repositories = false
  members_can_create_pages                 = false
  members_can_create_public_pages          = false
  members_can_create_private_pages         = false
}

# Set Luís Pires as the owner of the organization
resource "github_membership" "lupirex_owner_membership" {
  username = "lupirex"
  role     = "admin"
}

# Add users to the organization with member role
resource "github_membership" "organization_membership_for_users" {
  for_each = toset(var.usernames)
  username = each.key
}

resource "github_team" "github_organization_teams" {
  for_each    = var.organization_teams
  name        = each.key
  description = each.value
}
