locals {
  ip_set_rules = []
  rule_groups = [
    {
      name     = "${var.name_prefix}-group-ip-whitelist-rule-1"
      priority = "10"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "${var.name_prefix}-group-ip-whitelist-metric"
        sampled_requests_enabled   = true
      }

      visibility_config = {
        metric_name                = "${var.name_prefix}-group-ip-whitelist-metric"
      }

      rule_group_reference_statement = {
        arn  = length(aws_wafv2_rule_group.ip-whitelist.*.arn) > 0 ? aws_wafv2_rule_group.ip-whitelist.0.arn : null
      }
    }
  ]
}


variable "enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "name_prefix" {
  type        = string
  description = "Name prefix used to create resources."
  default     = "AWL-WAF-"
}

variable "alb_arn" {
  type        = string
  description = "Application Load Balancer ARN"
  default     = ""
}

variable "alb_arn_list" {
  type        = list(string)
  description = "Application Load Balancer ARN list"
  default     = []
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}

variable "rules" {
  description = "List of WAF rules."
  default     = []
}

variable "ip_set_rules" {
  description = "List of WAF ip set rules to detect web requests coming from particular IP addresses or address ranges."
  default     = []
}

variable "rule_groups" {
  description = "List of WAF rule groups"
  default     = []
}

variable "ip_rate_based_rule" {
  description = "A rate-based rule tracks the rate of requests for each originating IP address, and triggers the rule action when the rate exceeds a limit that you specify on the number of requests in any 5-minute time span"
  default     = null
}

variable "visibility_config" {
  description = "Visibility config for WAFv2 web acl. https://www.terraform.io/docs/providers/aws/r/wafv2_web_acl.html#visibility-configuration"
  type        = map(string)
  default     = {}
}

variable "create_alb_association" {
  type        = bool
  description = "Whether to create alb association with WAF web acl"
  default     = true
}

variable "create_logging_configuration" {
  type        = bool
  description = "Whether to create logging configuration in order start logging from a WAFv2 Web ACL to Amazon Kinesis Data Firehose."
  default     = false
}

variable "log_destination_configs" {
  type        = list(string)
  description = "The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want to associate with the web ACL. Currently, only 1 ARN is supported."
  default     = []
}

variable "redacted_fields" {
  description = "The parts of the request that you want to keep out of the logs. Up to 100 `redacted_fields` blocks are supported."
  default     = []
}

variable "allow_default_action" {
  type        = bool
  description = "Set to `true` for WAF to allow requests by default. Set to `false` for WAF to block requests by default."
  default     = true
}

variable "scope" {
  type        = string
  description = "Specifies whether this is for an AWS CloudFront distribution or for a regional application. Valid values are CLOUDFRONT or REGIONAL. To work with CloudFront, you must also specify the region us-east-1 (N. Virginia) on the AWS provider."
  default     = "REGIONAL"
}