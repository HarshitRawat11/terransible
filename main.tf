resource "aws_vpc" "custom_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "custom_vpc-${random_id.random.dec}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "custom_igw-${random_id.random.dec}"
  }
}

resource "aws_route_table" "custom_public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "custom_public_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.custom_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


resource "random_id" "random" {
  byte_length = 2
}