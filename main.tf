provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "jenkins_master" {
  ami           = "ami-046c2381f11878233" 
  instance_type = "t2.micro"
  key_name      = "Srilatha_key"

  tags = {
    Name = "Srilatha_JenkinsMaster"
  }
}

resource "aws_instance" "app_node" {
  ami           = "ami-046c2381f11878233"
  instance_type = "t2.micro"
  key_name      = "Assignment_key"

  tags = {
    Name = "Srilatha_ApplicationNode"
  }
}

resource "aws_security_group" "cicd_sg" {
  name        = "cicd-sg"
  description = "Allow SSH, Jenkins, Tomcat"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 8081
    to_port     = 8081
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
