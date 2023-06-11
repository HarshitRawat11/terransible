resource "aws_vpc" "custom_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "public-vpc-${random_id.random.dec}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "name" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "igw-${random_id.random.dec}"
  }
}

resource "aws_route_table" "custom_public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.custom_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_default_route_table" "custom_private_rt" {
  default_route_table_id = aws_vpc.custom_vpc.default_route_table_id

  tags = {
    Name = "private-rt"
  }
}

data "aws_availability_zones" "available" {

}

resource "random_id" "random" {
  byte_length = 2
}