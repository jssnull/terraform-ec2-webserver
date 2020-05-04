provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "webservers" {
  name        = "allow_http"
  description = "Allow http inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
    ami = "ami-07ba77e2ad0ff38b8"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.webservers.id}"]
}