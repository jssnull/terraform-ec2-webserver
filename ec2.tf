provider "aws" {
  region = "us-west-2"
}

variable "key_id" {
  description = "ssl key pair used to access the bastion instance via SSH"
  type        = string
  sensitive   = true
}

resource "aws_security_group" "webservers" {
  name        = "allow_http"
  description = "Allow http inbound traffic"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "webserver" {
    ami = "ami-083ac7c7ecf9bb9b0"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.webservers.id}"]
    associate_public_ip_address=true
    key_name = var.key_id 
}