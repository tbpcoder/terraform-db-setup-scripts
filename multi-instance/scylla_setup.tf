resource "aws_security_group" "scylla_database_sg" {
  name        = var.scylla_database_sg_name
  vpc_id      = var.vpc_id

  tags = {
    Name = var.scylla_database_sg_name
    terraform = "true"
  }

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

resource "aws_instance" "scylla_db_instance" {
  ami                   = var.ami
  instance_type         = var.scylla_instance_type
  key_name              = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.scylla_database_sg.id]
  subnet_id           = var.subnet_id
  associate_public_ip_address = false
  count = var.instance_count
  root_block_device {
    volume_type          = var.scylla_storage_type
    delete_on_termination = true
    volume_size          = var.scylla_storage_size
  }
  tags = {
    Name="scylla_db_instance"
    name="scylla_DB_instance"
  }
  user_data = file("../script_files/scylla_install.sh")
}