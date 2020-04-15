# Bucket ID

data "terraform_remote_state" "logs" {
  backend = "atlas"

  config = {
    name = "AffinityWater/logs-core-prod"
  }
}

locals {
  cloudtrail_bucket_id = data.terraform_remote_state.logs.outputs.cloudtrail_bucket_id
}

variable "alias" {
}

