data "aws_ssoadmin_instances" "default" {}

/// View Only
resource "aws_ssoadmin_permission_set" "viewonly" {
  name             = "ViewOnly"
  description      = "https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html#jf_view-only-user"
  instance_arn     = tolist(data.aws_ssoadmin_instances.default.arns)[0]
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "viewonly" {
  instance_arn       = aws_ssoadmin_permission_set.viewonly.instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.viewonly.arn
}

/// Power User
resource "aws_ssoadmin_permission_set" "poweruser" {
  name             = "PowerUser"
  description      = "https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html#jf_developer-power-user"
  instance_arn     = tolist(data.aws_ssoadmin_instances.default.arns)[0]
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "poweruser" {
  instance_arn       = aws_ssoadmin_permission_set.poweruser.instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  permission_set_arn = aws_ssoadmin_permission_set.poweruser.arn
}

/// Administrator
resource "aws_ssoadmin_permission_set" "administrator" {
  name             = "AdministratorAccess"
  description      = "https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html#jf_administrator"
  instance_arn     = tolist(data.aws_ssoadmin_instances.default.arns)[0]
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "administrator" {
  instance_arn       = aws_ssoadmin_permission_set.administrator.instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.administrator.arn
}