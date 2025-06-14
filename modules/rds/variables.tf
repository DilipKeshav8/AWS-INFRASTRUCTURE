variable "project_name" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
  sensitive = true
}

variable "secrets_manager_arn" {
  type = string
}

variable "ec2_sg_id" {
  type = string
  default = null
}

variable "db_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "vpc_id" {
  type = string
}