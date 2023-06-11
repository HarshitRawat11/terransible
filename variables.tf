variable "ACCESS_KEY" {
  description = "Access key of the aws user"
}

variable "SECRET_KEY" {
  description = "Secret access key of the aws user"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.123.0.0/16"
  description = "Cidr block of custom vpc"
}

variable "public_cidrs" {
  type        = list(string)
  default     = ["10.123.1.0/24", "10.123.2.0/24"]
  description = "Cidr block of the subnet"
}