resource "aws_db_parameter_group" "maximo" {
  name   = "rds-option-group-oracle-se2-12-1-maximo"
  family = "oracle-se2-12.1"

  parameter {
    name  = "archive_lag_target"
    value = "300"
  }
  
  parameter {
    name  = "db_block_checking"
    value = "MEDIUM"
  }
  
  parameter {
    name  = "dbfips_140"
    value = "FALSE"
  }
  
  parameter {
    name  = "db_recovery_file_dest_size"
    value = "1073741824"
  }
  
  parameter {
    name  = "heat_map"
    value = "OFF"
  }
  
  parameter {
    name  = "job_queue_processes"
    value = "50"
  }
  
  parameter {
    name  = "max_string_size"
    value = "STANDARD"
  }
  
  parameter {
    name  = "memory_max_target"
    value = "IF({DBInstanceClassHugePagesDefault}, 0, {DBInstanceClassMemory*3/4})"
  }
  
  parameter {
    name  = "memory_target"
    value = "IF({DBInstanceClassHugePagesDefault}, 0, {DBInstanceClassMemory*3/4})"
  }
  
  parameter {
    name  = "open_cursors"
    value = "300"
  }
  
  parameter {
    name  = "pga_aggregate_target"
    value = "IF({DBInstanceClassHugePagesDefault}, {DBInstanceClassMemory*1/8}, 0)"
  }
  
  parameter {
    name  = "processes"
    value = "LEAST({DBInstanceClassMemory/9868951}, 20000)"
  }
  
  parameter {
    name  = "recyclebin"
    value = "OFF"
  }
  
  parameter {
    name  = "sga_target"
    value = "IF({DBInstanceClassHugePagesDefault}, {DBInstanceClassMemory*3/4}, 0)"
  }
  
  parameter {
    name  = "undo_tablespace"
    value = "UNDO_T1"
  }
  
  parameter {
    name  = "use_large_pages"
    value = "{DBInstanceClassHugePagesDefault}"
  }
  
  # Extras from default for Maximo
  parameter {
    name  = "cursor_sharing"
    value = "force"
  }
  
  parameter {
    name  = "nls_length_semantics"
    value = "char"
  }
  
  parameter {
    name  = "workarea_size_policy"
    value = "auto"
  }
  
  parameter {
    name  = "processes"
    apply_method = "pending-reboot"
    value = "4000"
  }
  
  parameter {
    name  = "open_cursors"
    value = "3000"
  }
  
  parameter {
    name  = "sessions"
    apply_method = "pending-reboot"
    value = "4000"
  }
  
  parameter {
    name  = "transactions"
    apply_method = "pending-reboot"
    value = "2425"
  }
  
  parameter {
    name  = "session_cached_cursors"
    apply_method = "pending-reboot"
    value = "400"
  }
  
  parameter {
    name  = "session_max_open_files"
    apply_method = "pending-reboot"
    value = "300"
  }
}
