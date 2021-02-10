
variable "env_name" {
  type        = string
  description = "The environment name to use when prefixing and tagging resources. eg. (dev|staging|prod)"
}

variable "resource_name" {
  type        = string
  description = "Used in resource names and tags. eg. demoapp"
}

variable "aws_region" {
  type = string
}

variable "database_hostaddr" {
  type = string
  description = "DATABASE_HOSTADDR For the database"
}

variable "database_name" {
  type = string
  description = "DATABASE_NAME For the database"
}

variable "database_username" {
  type = string
  description = "DATABASE_USERNAME For the database"
}

variable "database_pass" {
  type = string
  description = "DATABASE_PASS For the database"
}
