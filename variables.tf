variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "IPV4 CIDR for the VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "The VPC CIDR must be a valid IPv4 CIDR block."
  }


}

variable "subnet_cidr" {
  description = "IPV4 CIDR for the subnet"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.subnet_cidr))
    error_message = "The subnet CIDR must be a valid IPv4 CIDR block."
  }


}

variable "welcome_message" {
  description = "Message displayed on the web page"
  type        = string
  default     = "Hello from Terraform!"

  validation {
    condition     = length(trimspace(var.welcome_message)) > 0
    error_message = "The welcome message must not be empty."
  }

}
