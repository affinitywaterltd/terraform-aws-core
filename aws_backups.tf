locals {
  time_offset = -1
}

#
# IAM Service Role
#
resource "aws_iam_role" "aws_backup_service_role" {
  name               = "AWSBackupDefaultServiceRole"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "aws_backup_service_role_attach_backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.aws_backup_service_role.name
}

resource "aws_iam_role_policy_attachment" "aws_backup_service_role_attach_restore" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  role       = aws_iam_role.aws_backup_service_role.name
}

resource "aws_iam_policy" "aws_backup_iam_assume_role" {
  name   = "aws_backup_iam_assume_role"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws_backup_iam_assume_attach" {
  policy_arn = aws_iam_policy.aws_backup_iam_assume_role.arn
  role       = aws_iam_role.aws_backup_service_role.name
}


#
# AWS Backup Vault
#
resource "aws_backup_vault" "aws_backup_vault_master" {
  name        = "backup_vault_master"
}


###################################################
###################################################
############### Plan Specifications ###############
###################################################
###################################################
#
# Frequency - Daily
# Time - 2200
# Retention - 30days
#
# AWS Backup Plan
#
resource "aws_backup_plan" "aws_backup_plan_daily_2200_30days" {
  name = "aws_backup_plan_daily_2200_30days"
  rule {
    rule_name         = "aws_backup_rule_daily_2200_30days"
    target_vault_name = aws_backup_vault.aws_backup_vault_master.name

    schedule          = "cron(0 ${22 + local.time_offset} * * ? *)"
    start_window      = 60
    completion_window = 360

    recovery_point_tags = {
        BackupApplication   = "AWS Backups"
        BackupPlan          = "aws_backup_plan_daily_2200_30days"
    }

    lifecycle {
      cold_storage_after  = 0
      delete_after        = 30
    }
  }
}

#
# AWS Backup Selection
#
resource "aws_backup_selection" "aws_backup_selection_daily_2200_30days" {
  name          = "aws_backup_selection_daily_2200_30days"
  plan_id       = aws_backup_plan.aws_backup_plan_daily_2200_30days.id
  iam_role_arn  = aws_iam_role.aws_backup_service_role.arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "2200:30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "2200;30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "VSS;2200;30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "VSS;2200;30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Scheduler:Snapshot"
    value = "2200;30"
  }
}


#
# Frequency - Daily
# Time - 1300
# Retention - 30days
#
# AWS Backup Plan
#
resource "aws_backup_plan" "aws_backup_plan_daily_1300_30days" {
  name = "aws_backup_plan_daily_1300_30days"
  rule {
    rule_name         = "aws_backup_rule_daily_1300_30days"
    target_vault_name = aws_backup_vault.aws_backup_vault_master.name

    schedule          = "cron(0 ${13 + local.time_offset} * * ? *)"
    start_window      = 60
    completion_window = 360

    recovery_point_tags = {
        BackupApplication   = "AWS Backups"
        BackupPlan          = "aws_backup_plan_daily_1300_30days"
    }

    lifecycle {
      cold_storage_after  = 0
      delete_after        = 30
    }
  }
}

#
# AWS Backup Selection
#
resource "aws_backup_selection" "aws_backup_selection_daily_1300_30days" {
  name          = "aws_backup_selection_daily_1300_30days"
  plan_id       = aws_backup_plan.aws_backup_plan_daily_1300_30days.id
  iam_role_arn  = aws_iam_role.aws_backup_service_role.arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "1300:30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "1300;30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "VSS;1300;30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "VSS;1300;30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Scheduler:Snapshot"
    value = "1300;30"
  }
}


#
# Frequency - Daily
# Time - 0200
# Retention - 30days
#
# AWS Backup Plan
#
resource "aws_backup_plan" "aws_backup_plan_daily_0200_30days" {
  name = "aws_backup_plan_daily_0200_30days"
  rule {
    rule_name         = "aws_backup_rule_daily_0200_30days"
    target_vault_name = aws_backup_vault.aws_backup_vault_master.name

    schedule          = "cron(0 ${02 + local.time_offset} * * ? *)"
    start_window      = 60
    completion_window = 360

    recovery_point_tags = {
        BackupApplication   = "AWS Backups"
        BackupPlan          = "aws_backup_plan_daily_0200_30days"
    }

    lifecycle {
      cold_storage_after  = 0
      delete_after        = 30
    }
  }
}

#
# AWS Backup Selection
#
resource "aws_backup_selection" "aws_backup_selection_daily_0200_30days" {
  name          = "aws_backup_selection_daily_0200_30days"
  plan_id       = aws_backup_plan.aws_backup_plan_daily_0200_30days.id
  iam_role_arn  = aws_iam_role.aws_backup_service_role.arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "0200:30"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "0200;30"
  }
}


#
# Frequency - Weekly
# Time - 2200
# Retention - 7days
#
# AWS Backup Plan
#
resource "aws_backup_plan" "aws_backup_plan_daily_2200_7days" {
  name = "aws_backup_plan_daily_2200_7days"
  rule {
    rule_name         = "aws_backup_rule_daily_2200_7days"
    target_vault_name = aws_backup_vault.aws_backup_vault_master.name

    schedule          = "cron(0 ${22 + local.time_offset} * * ? *)"
    start_window      = 60
    completion_window = 360

    recovery_point_tags = {
        BackupApplication   = "AWS Backups"
        BackupPlan          = "aws_backup_plan_daily_2200_7days"
    }

    lifecycle {
      cold_storage_after  = 0
      delete_after        = 7
    }
  }
}

#
# AWS Backup Selection
#
resource "aws_backup_selection" "aws_backup_selection_daily_2200_7days" {
  name          = "aws_backup_selection_daily_2200_7days"
  plan_id       = aws_backup_plan.aws_backup_plan_daily_2200_7days.id
  iam_role_arn  = aws_iam_role.aws_backup_service_role.arn

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "2200:7"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "2200;7"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "VSS;2200;7"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupDaily"
    value = "VSS;2200;7"
  }

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "Scheduler:Snapshot"
    value = "2200;7"
  }
}


#
# Frequency - Monthly
# Time - 2200
# Retention - 2years (730 days)
#
# AWS Backup Plan
#
resource "aws_backup_plan" "aws_backup_plan_daily_2200_730days" {
  name = "aws_backup_plan_daily_2200_730days"
  rule {
    rule_name         = "aws_backup_rule_daily_2200_730days"
    target_vault_name = aws_backup_vault.aws_backup_vault_master.name

    schedule          = "cron(0 ${22 + local.time_offset} * * ? *)"
    start_window      = 60
    completion_window = 360

    recovery_point_tags = {
        BackupApplication   = "AWS Backups"
        BackupPlan          = "aws_backup_plan_daily_2200_730days"
    }

    lifecycle {
      cold_storage_after  = 0
      delete_after        = 730
    }
  }
}

#
# AWS Backup Selection
#
resource "aws_backup_selection" "aws_backup_selection_daily_2200_730days" {
  name          = "aws_backup_selection_daily_2200_730days"
  plan_id       = aws_backup_plan.aws_backup_plan_daily_2200_730days.id
  iam_role_arn  = aws_iam_role.aws_backup_service_role.arn


  selection_tag {
    type  = "STRINGEQUALS"
    key   = "BackupMonthly"
    value = "2200;2yr"
  }
}