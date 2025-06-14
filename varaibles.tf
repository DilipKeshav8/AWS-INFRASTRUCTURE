variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "my-app"
}

variable "db_username" {
  description = "RDS DB username"
  type        = string
}

variable "db_password" {
  description = "RDS DB password"
  type        = string
  sensitive   = true
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "IAM Instance Profile Name for EC2"
  type        = string
}

variable "notification_email" {
  description = "Email address for SNS notifications"
  type        = string
}