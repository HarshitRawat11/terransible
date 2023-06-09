terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
  region     = "us-east-1"
}