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

variable "waf_kinesis_s3_bucket"{
  default = null
}

variable "waf_kinesis_iam_role"{
  default = null
}

variable "kinesis_enabled"{
  default = false
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


### WAF Module Variables


variable "waf_enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = false
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
  default     = false
}

variable "create_logging_configuration" {
  type        = bool
  description = "Whether to create logging configuration in order start logging from a WAFv2 Web ACL to Amazon Kinesis Data Firehose."
  default     = true
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

### WAF AWS Managed Rules

locals {
  rules = [
    {
      name     = "AWSManagedRulesCommonRuleSet-rule-1"
      priority = "20"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWSManagedRulesCommonRuleSet-metric"
        sampled_requests_enabled   = true
      }

      visibility_config = {
        metric_name                = "AWSManagedRulesCommonRuleSet-metric"
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
        excluded_rule = []
      }
    },
    {
      name     = "AWSManagedRulesKnownBadInputsRuleSet-rule-2"
      priority = "30"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name = "AWSManagedRulesKnownBadInputsRuleSet-metric"
        sampled_requests_enabled   = true
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
        excluded_rule = []
      }
    },
    {
      name     = "AWSManagedRulesAnonymousIpList-rule-3"
      priority = "40"

      override_action = "count"

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWSManagedRulesAnonymousIpList-metric"
        sampled_requests_enabled   = true
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesAnonymousIpList"
        vendor_name = "AWS"
        excluded_rule = []
      }
    },
    {
      name     = "AWSManagedRulesAmazonIpReputationList-rule-4"
      priority = "50"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWSManagedRulesAmazonIpReputationList-metric"
        sampled_requests_enabled   = true
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
        excluded_rule = []
      }
    },
    {
      name     = "AWSManagedRulesSQLiRuleSet-rule-5"
      priority = "60"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWSManagedRulesSQLiRuleSet-metric"
        sampled_requests_enabled   = true
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
        excluded_rule = []
      }
    },
    {
      name     = "AWSManagedRulesWindowsRuleSet-rule-6"
      priority = "70"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "AWSManagedRulesWindowsRuleSet-metric"
        sampled_requests_enabled   = true
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesWindowsRuleSet"
        vendor_name = "AWS"
        excluded_rule = []
      }
    },
    {
      name     = "CyberSecurityCloudInc-CyberSecurityCloud-HighSecurityOWASPSet-rule-7"
      priority = "80"

      override_action = "none" # set to none if not specified

      visibility_config = {
        cloudwatch_metrics_enabled = true
        metric_name                = "CyberSecurityCloud-HighSecurityOWASPSet-"
        sampled_requests_enabled   = true
      }

      managed_rule_group_statement = {
        name        = "CyberSecurityCloud-HighSecurityOWASPSet-"
        vendor_name = "Cyber Security Cloud Inc."
        excluded_rule = []
      }
    },
  ]
}