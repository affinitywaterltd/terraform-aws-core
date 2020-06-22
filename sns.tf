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