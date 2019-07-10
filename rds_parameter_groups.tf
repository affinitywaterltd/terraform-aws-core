resource "aws_db_parameter_group" "maximo" {
  name   = "rds-option-group-oracle-se2-12-1-maximo"
  family = "oracle-se2-12.1"

  parameter {
    name  = "archive_lag_target"
    value = "300"
  }

  parameter {
    name  = "audit_file_dest"
    value = "/rdsdbdata/admin/{dbName}/adump"
  }
  /*
  parameter {
    name  = "control_files"
    value = "/rdsdbdata/db/{dbName}_{DBUniqueNameSuffix}/controlfile/control-01.ctl"
  }*/
  
  parameter {
    name  = "db_block_checking"
    value = "MEDIUM"
  }
  
  parameter {
    name  = "db_create_file_dest"
    value = "/rdsdbdata/db"
  }
  
  parameter {
    name  = "dbfips_140"
    value = "FALSE"
  }
  
  parameter {
    name  = "db_name"
    value = "{dbName}"
  }
  
  parameter {
    name  = "db_recovery_file_dest_size"
    value = "1073741824"
  }
  
  parameter {
    name  = "db_unique_name"
    value = "{dbName}_{DBUniqueNameSuffix}"
  }
  /*
  parameter {
    name  = "dg_broker_config_file1"
    value = "/rdsdbdata/config/dr1{dbName}.dat"
  }
  
  parameter {
    name  = "dg_broker_config_file2"
    value = "/rdsdbdata/config/dr2{dbName}.dat"
  }*/
  
  parameter {
    name  = "diagnostic_dest"
    value = "/rdsdbdata/log"
  }
  
  parameter {
    name  = "enable_pluggable_database"
    value = "FALSE"
  }
  /*
  parameter {
    name  = "filesystemio_options"
    value = "setall"
  }*/
  
  parameter {
    name  = "heat_map"
    value = "OFF"
  }
  
  parameter {
    name  = "job_queue_processes"
    value = "50"
  }
  
  parameter {
    name  = "local_listener"
    value = "(address=(protocol=tcp)(host=)(port={EndPointPort}))"
  }
  
  parameter {
    name  = "log_archive_dest_1"
    value = "location=\"/rdsdbdata/db/{dbName}_{DBUniqueNameSuffix}/arch/redolog\", valid_for=(ALL_LOGFILES,ALL_ROLES)"
  }
  
  parameter {
    name  = "log_archive_format"
    value = "-%s-%t-%r.arc"
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
    name  = "spfile"
    value = "/rdsdbbin/oracle/dbs/spfile{dbName}.ora"
  }
  
  parameter {
    name  = "standby_file_management"
    value = "AUTO"
  }
  
  parameter {
    name  = "undo_tablespace"
    value = "UNDO_T1"
  }
  
  parameter {
    name  = "use_large_pages"
    value = "{DBInstanceClassHugePagesDefault}"
  }
}
