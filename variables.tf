# Bucket ID

data "terraform_remote_state" "logs" {
  backend = "atlas"

  config = {
    name = "AffinityWater/logs-core-prod"
  }
}

data "aws_iam_role" "delivery_status_iam_role" {
  name = "awl-sns-delivery-logging"
}

locals {
  cloudtrail_bucket_id = data.terraform_remote_state.logs.outputs.cloudtrail_bucket_id
}

variable "alias" {
}

variable "configure_sns" {
  default = false
}

variable "monthly_spend_limit" {
  default = 50
}

variable "delivery_status_iam_role_arn" {
  default = null
}

variable "delivery_status_success_sampling_rate" {
  default = 100
}

variable "default_sender_id" {
  default = null
}

variable "default_sms_type" {
  default = "Transactional"
}

variable "usage_report_s3_bucket" {
  default = null
}