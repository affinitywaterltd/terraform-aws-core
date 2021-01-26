resource "aws_sns_topic" "sns_alerts_infra_info" {
  name         = "sns_alerts_infra_info"
  display_name = "Infra-Info"

  tags = local.base_tags
}

resource "aws_sns_topic" "sns_alerts_infra_warning" {
  name         = "sns_alerts_infra_warning"
  display_name = "Infra-Warn"

  tags = local.base_tags
}

resource "aws_sns_topic" "sns_alerts_infra_critical" {
  name         = "sns_alerts_infra_critical"
  display_name = "Infra-Critical"

  tags = local.base_tags
}

resource "aws_sns_sms_preferences" "default" {
  count = var.configure_sns ? 1 : 0

  monthly_spend_limit = var.monthly_spend_limit
  delivery_status_iam_role_arn = var.delivery_status_iam_role_arn == null ? data.aws_iam_role.delivery_status_iam_role.arn : var.delivery_status_iam_role_arn
  delivery_status_success_sampling_rate = var.delivery_status_success_sampling_rate
  default_sender_id = var.default_sender_id
  default_sms_type = var.default_sms_type
  usage_report_s3_bucket = var.usage_report_s3_bucket == null ? module.s3_sns_usage_report.id : var.usage_report_s3_bucket
}

module "s3_sns_usage_report" {
  count = var.usage_report_s3_bucket == null ? 1 : 0

  source = "github.com/affinitywaterltd/terraform-aws-s3"
  bucket = "awl-sns-usage_report-${data.aws_caller_identity.current.account_id}"

  tags = {
      "Description" = "S3 bucket used for SNS Usage Reports"
  }
}

