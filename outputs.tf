output "rds_options_oracle_se1_v11_2_a" {
  description = "Oracle-SE1 - Default + Statpack + NW Encryption"
  value       = aws_db_option_group.rds_options_oracle_se1_v11_2_a.name
}

output "rds_options_oracle_se2_v12_1_a" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption"
  value       = aws_db_option_group.rds_options_oracle_se2_v12_1_a.name
}

output "rds_options_oracle_se2_v12_2_a" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption"
  value       = aws_db_option_group.rds_options_oracle_se2_v12_2_a.name
}

# Option sets with Timezone
output "rds_options_oracle_se1_v11_2_b" {
  description = "Oracle-SE1 - Default + Statpack + NW Encryption + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se1_v11_2_b.name
}

output "rds_options_oracle_se2_v12_1_b" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se2_v12_1_b.name
}

output "rds_options_oracle_se2_v12_2_b" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se2_v12_2_b.name
}

output "rds_options_oracle_se2_v18_0_b" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se2_v18_0_b.name
}

output "rds_options_oracle_se2_v19_0_b" {
  description = "Oracle-SE2 - Default + Statpack + NW Encryption + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se2_v19_0_b.name
}

# Option sets without NW Encryption
output "rds_options_oracle_se1_v11_2_c" {
  description = "Oracle-SE1 - Default + Statpack + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se1_v11_2_c.name
}

output "rds_options_oracle_se2_v12_1_c" {
  description = "Oracle-SE2 - Default + Statpack + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se2_v12_1_c.name
}

output "rds_options_oracle_se2_v12_2_c" {
  description = "Oracle-SE2 - Default + Statpack + Timezone"
  value       = aws_db_option_group.rds_options_oracle_se2_v12_2_c.name
}

