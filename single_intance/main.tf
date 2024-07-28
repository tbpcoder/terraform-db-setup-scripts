provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "database_sg" {
  name        = var.database_sg_name
  vpc_id      = var.vpc_id
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "db team ssh access"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "db_instance" {
  ami                   = var.ami
  instance_type         = var.instance_type
  key_name              = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  subnet_id           = var.subnet_id
  associate_public_ip_address = false
  count = var.instance_count
  root_block_device {
    volume_type          = var.storage_type
    delete_on_termination = true
    volume_size          = var.storage_size
  }
  tags = {
    name="DB_single_instance"
  }
  user_data = <<-EOF
    #!/bin/bash
    ${file("../script_files/mongo_install.sh")}
    ${file("../script_files/mysql_install.sh")}
    ${file("../script_files/postgresql_install.sh")}
    ${file("../script_files/scylla_install.sh")}
    EOF
}