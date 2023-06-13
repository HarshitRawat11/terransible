variable "ACCESS_KEY" {
  type        = string
  description = "Access key of the aws user"
}

variable "SECRET_KEY" {
  type        = string
  description = "Secret access key of the aws user"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.123.0.0/16"
  description = "cidr block of custom vpc"
}

variable "newbits" {
  type        = number
  default     = 8
  description = "newbits of the cidrsubnet function"
}

variable "ingress_ip" {
  type        = list(string)
  default     = ["103.198.173.215/32"]
  description = "cidr block allowed for ingress rule"
}

variable "egress_ip" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "cidr block aloowed for egress rule"
}