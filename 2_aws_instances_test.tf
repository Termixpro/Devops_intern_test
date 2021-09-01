provider "aws" {
  access_key = "insert acces key"
  secret_key = "insert secret key"
  region     = "eu-central-1"
}

resource "aws_instance" "Ubuntu" {
  ami                    = "ami-05f7491af5eef733a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data              = file("user_data.sh")
}

resource "aws_instance" "Ubuntu1" {
  ami                    = "ami-05f7491af5eef733a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  user_data              = file("user_data.sh")
}

resource "aws_security_group" "webserver" {
  name        = "WebServer_Security_Group"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 49153
    to_port     = 49153
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
