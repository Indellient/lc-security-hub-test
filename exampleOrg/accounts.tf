// This assumes you manually enabled AWS SSO / Organizations
data "aws_organizations_organization" "org" {}

/////////////////////////////
///// Sandbox OU

/// This OU should hold short-lived accounts used for testing new AWS development.
/// Sandbox accounts can be provisioned per developer, or shared. Permissions on
/// Sandbox accounts should be looser to not inhibit development.

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "Sandbox"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "sandbox" {
  name      = "Sandbox"
  email     = "${var.email_group}+sandbox@bar.com"
  parent_id = aws_organizations_organizational_unit.sandbox.id
}

/////////////////////////////
///// Workloads OU

/// This OU should hold accounts dedicated to operation of core business workloads.
/// These accounts are often organized in additional OUs, separated by development
/// lifecycle.

resource "aws_organizations_organizational_unit" "workloads" {
  name      = "Workloads"
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "staging" {
  name      = "Staging"
  email     = "${var.email_group}+staging@bar.com"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_account" "production" {
  name      = "Production"
  email     = "${var.email_group}+prod@bar.com"
  parent_id = aws_organizations_organizational_unit.workloads.id
}