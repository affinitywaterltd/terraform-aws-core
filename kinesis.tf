resource "aws_cloudwatch_log_group" "firehose" {
  count       = var.kinesis_enabled && var.waf_enabled ? 1 : 0
  name              = "/aws/kinesis/firehose/waf"
  retention_in_days = "30"
}


resource "aws_kinesis_firehose_delivery_stream" "waf_kinesis_firehose" {
  count       = var.kinesis_enabled && var.waf_enabled ? 1 : 0
  name        = "aws-waf-logs-firehose-default"
  destination = "extended_s3"

  server_side_encryption {
    enabled = true
  }

  extended_s3_configuration {
    role_arn   = var.waf_kinesis_iam_role
    bucket_arn = var.waf_kinesis_s3_bucket

    cloudwatch_logging_options {
      enabled = true
      log_group_name = aws_cloudwatch_log_group.firehose.name
      log_stream_name = "default"
    }
  }
}