resource "aws_wafv2_ip_set" "ip-whitelist" {
  count              = var.enabled ? 1 : 0
  name               = "${var.name_prefix}-ip-whitelist"
  description        = "IP Whitelist"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = []
}

resource "aws_wafv2_rule_group" "ip-whitelist" {
  count       = var.enabled ? 1 : 0
  name        = "${var.name_prefix}-group-ip-whitelist"
  description = "An rule group containing whitelist IPs"
  scope       = "REGIONAL"
  capacity    = 50

  rule {
    name     = "rule-1"
    priority = 1

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.ip-whitelist.0.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.name_prefix}-ip-whitelist-metric"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.name_prefix}-ip-whitelist-metric"
      sampled_requests_enabled   = true
    }
}