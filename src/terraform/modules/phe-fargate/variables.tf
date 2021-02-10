
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

# TurnerLab Fargate Module
# The port the container will listen on, used for load balancer health check
# Best practice is that this value is higher than 1024 so the container processes
# isn't running at root.
variable "container_port" {
  default = 8080
}

# The port the load balancer will listen on
variable "lb_port" {
  default = "80"
}

# The load balancer protocol
variable "lb_protocol" {
  default = "HTTP"
}

# Network configuration
#
variable "vpc" {
  description = "The VPC to use for the Fargate cluster"
}

#
variable "private_subnets" {
  description = "The private subnets, minimum of 2, that are a part of the VPC(s)"
}

#
variable "public_subnets" {
  description = "The public subnets, minimum of 2, that are a part of the VPC(s)"
}

variable "health_check" {
  description = "/health"
}

variable "certificate_arn" {
  description = ""
}
