variable "project_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "iam_instance_profile_name" {
  type = string
}

variable "security_group_id" {
  type = string
}