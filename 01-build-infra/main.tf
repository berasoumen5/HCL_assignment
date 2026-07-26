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
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "learn-terraform"
  }
}