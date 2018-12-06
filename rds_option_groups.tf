
# Default Option Group for Oracle-SE1
resource "aws_db_option_group" "rds_options_oracle_se1_v11_2_a" {
  name                     = "rds-options-oracle-se1-v11-2-a"
  option_group_description = "Default + Statpack + NW Encryption"
  engine_name              = "oracle-se1"
  major_engine_version     = "11.2"

  tags = "${local.common_tags}"

  option {
    option_name = "STATSPACK"

  }

  option {
    option_name = "NATIVE_NETWORK_ENCRYPTION"

    option_settings {
      name  = "SQLNET.CRYPTO_CHECKSUM_TYPES_SERVER"
      value = "SHA1, MD5"
    }
    option_settings {
      name  = "SQLNET.ENCRYPTION_TYPES_SERVER"
      #value = "RC4_256, AES256, AES192, 3DES168, RC4_128, AES128, 3DES112, RC4_56, DES, RC4_40, DES40"
      value = "RC4_256"
    }option_settings {
      name  = "SQLNET.CRYPTO_CHECKSUM_SERVER"
      value = "REQUESTED"
    }option_settings {
      name  = "SQLNET.CRYPTO_ENCRYPTION_SERVER"
      value = "REQUESTED"
    }
  }
}


# Default Option Group for Oracle-SE2
resource "aws_db_option_group" "rds_options_oracle_se2_v12_1_a" {
  name                     = "rds-options-oracle-se2-v12-1-a"
  option_group_description = "Default + Statpack + NW Encryption"
  engine_name              = "oracle-se2"
  major_engine_version     = "12.1"

  tags = "${local.common_tags}"

  option {
    option_name = "STATSPACK"

  }

  option {
    option_name = "NATIVE_NETWORK_ENCRYPTION"

    option_settings {
      name  = "SQLNET.CRYPTO_CHECKSUM_TYPES_SERVER"
      value = "SHA1, MD5"
    }
    option_settings {
      name  = "SQLNET.ENCRYPTION_TYPES_SERVER"      
      #value = "RC4_256, AES256, AES192, 3DES168, RC4_128, AES128, 3DES112, RC4_56, DES, RC4_40, DES40"
      value = "RC4_256"
    }option_settings {
      name  = "SQLNET.CRYPTO_CHECKSUM_SERVER"
      value = "REQUESTED"
    }option_settings {
      name  = "SQLNET.CRYPTO_ENCRYPTION_SERVER"
      value = "REQUESTED"
    }
  }
}