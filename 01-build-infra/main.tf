terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  required_version = ">= 1.2"
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "app_server" {
  ami           = "ami-09d88f7c4c272b0c5"
  instance_type = "t3.micro"
  tags = {
    Name = "learn-terraform"
  }
}