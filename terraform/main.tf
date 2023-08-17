terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  access_key = "AKIAQOCO2JX6DX73VB7X"
  secret_key = "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"
}


resource "aws_instance" "ec2_instances" {
  count = 3

  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "k3s"
  }
}

