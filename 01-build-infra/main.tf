terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }
  required_version = ">= 1.2"
}
terraform {
  backend "s3" {
    bucket       = "soumen-tf-learn-2026-8823"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}


provider "aws" {
  region = "ap-south-1"
}
# resource "aws_instance" "app_server" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   tags = {
#     Name = "learn-terraform"
#   }
# }