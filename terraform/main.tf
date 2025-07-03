


resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jdn_proxy" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "kolhai-laptop-key"
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name = "jdn-proxy-server"
  }
}

