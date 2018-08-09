# Bucket ID

data "terraform_remote_state" "logs" {
  backend = "atlas"

  config {
    name = "{AffinityWater/logs-core-prod}"
  }
}

local {
    cloudtrail_bucket_id =   "${data.terraform_remote_state.logs.cloudtrail_bucket_id}"
}

