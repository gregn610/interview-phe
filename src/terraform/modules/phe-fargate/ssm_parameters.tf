

resource "aws_ssm_parameter" "database_hostaddr" {
  name        = "/${var.env_name}/${var.resource_name}/database/database_hostaddr/master"
  description = "The databases parameter database_hostaddr"
  type        = "String"
  value       = var.database_hostaddr

  tags = var.common_tags
}
resource "aws_ssm_parameter" "database_name" {
  name        = "/${var.env_name}/${var.resource_name}/database/database_name/master"
  description = "The databases parameter database_name"
  type        = "String"
  value       = var.database_name

  tags = var.common_tags
}
resource "aws_ssm_parameter" "database_username" {
  name        = "/${var.env_name}/${var.resource_name}/database/database_username/master"
  description = "The databases parameter database_username"
  type        = "String"
  value       = var.database_username

  tags = var.common_tags
}
resource "aws_ssm_parameter" "database_pass" {
  name        = "/${var.env_name}/${var.resource_name}/database/database_pass/master"
  description = "The databases parameter database_pass"
  type        = "SecureString"
  value       = var.database_pass

  tags = var.common_tags
}

