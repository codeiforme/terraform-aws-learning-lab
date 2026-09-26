variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "IPV4 CIDR for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "IPV4 CIDR for the subnet"
  type        = string
}

variable "welcome_message" {
  description = "Message displayed on the web page"
  type        = string
  default     = "Hello from Terraform!"
}
