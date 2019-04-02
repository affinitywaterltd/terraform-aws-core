# SAML Provider for SSO

resource "aws_iam_saml_provider" "AzureAd" {
  name                   = "Azure_AD"
  saml_metadata_document = "${"${file("saml.xml")}"}"
}

# Password Policy

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

# Cloudtrail

resource "aws_cloudtrail" "global_Default" {
  name                          = "Default"
  s3_bucket_name                = "${local.cloudtrail_bucket_id}"
  is_multi_region_trail         = true
  include_global_service_events = true
  enable_log_file_validation    = true
  tags                          = "${local.base_tags}"
}

# Alias

resource "aws_iam_account_alias" "alias" {
  account_alias = "awl-${var.alias}"
}

# SSM Parameters
resource "aws_ssm_parameter" "ssm_param_cloudwatch_windows" {
  name  = "AmazonCloudWatch-windows"
  type  = "String"
  overwrite = true
  tags = "${local.base_tags}"
  value = "${"${file("${path.module}/cloudwatch_windows.json")}"}"
}