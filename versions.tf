
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # v3.20 breaks validation with AWS Backups - https://github.com/hashicorp/terraform-provider-aws/issues/16583
      version = "~> 3.0,!= 3.20"
    }
  }
}