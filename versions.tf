
terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  # Pinned due to https://github.com/hashicorp/terraform-provider-aws/issues/16583
  version = "~> 3.0,!= 3.20"
}