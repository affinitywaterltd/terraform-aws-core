
output "rds_options_oracle_se1_v11_2_a" {
  description = "Oracle-SE1 - Default + Statpack + NW Encryption"
  value       = "${aws_db_option_group.rds_options_oracle_se1_v11_2_a.name}"
}

output "rds_options_oracle_se2_v12_1_a" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption"
  value       = "${aws_db_option_group.rds_options_oracle_se2_v12_1_a.name}"
}
