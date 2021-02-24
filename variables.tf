# Bucket ID

data "terraform_remote_state" "logs" {
  backend = "atlas"

  config = {
    name = "AffinityWater/logs-core-prod"
  }
}

data "aws_caller_identity" "current" {}

data "aws_iam_role" "delivery_status_iam_role" {
  count = var.configure_sns ? 1 : 0
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

variable "name_prefix" {
  type        = string
  description = "Name prefix used to create resources."
}

variable "ip_rate_based_rule" {
  description = "A rate-based rule tracks the rate of requests for each originating IP address, and triggers the rule action when the rate exceeds a limit that you specify on the number of requests in any 5-minute time span"
  default     = null
}