variable "region" { type = string }

variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  type        = string
}

variable "laptop_ip_cidr" { type = string }

variable "module_prefix" {
  description = "The prefix for the resources."
  type        = string
  default     = "vite-app-demo"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "subnet_id" {
  description = "The Subnet ID where the instance will be launched."
  type        = string
}

variable "allowed_http_cidr" {
  description = "The CIDR block allowed to access HTTP (port 80)."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use."
  type        = string
  default     = "t3.micro"
}

variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
  default     = file("${path.module}/user-data.sh")
}

variable "iam_instance_profile" {
  type    = string
  default = null
}
