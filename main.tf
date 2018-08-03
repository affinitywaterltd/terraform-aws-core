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

