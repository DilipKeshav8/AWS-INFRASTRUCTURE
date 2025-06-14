variable "project_name" {
  type = string
}

variable "notification_email" {
  type = string
}

variable "ec2_instance_ids" {
  type = list(string)
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
