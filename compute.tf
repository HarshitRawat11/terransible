data "aws_ami" "server_ami" {
  most_recent = true

  owners = ["308"]

  filter {
    name   = "name"
    values = ["values"]
  }
}

resource "aws_instance" "main" {
  count                  = var.main_instance_count
  instance_type          = var.main_instance_type
  ami                    = data.aws_ami.name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.public_subnet[count.index].id

  root_block_device {
    volume_size = var.main_vol_size
  }

  tags = {
    Name = "main-${random_id.random_str[count.index].dec}"
  }

  # key_name = ""

}

resource "random_id" "random_str" {
  count       = var.main_instance_count
  byte_length = 2
}