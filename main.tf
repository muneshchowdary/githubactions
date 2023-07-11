#terraform {
  #required_providers {
    #ubuntu = {
    #  source  = "hashicorp/aws"
   #   version = ">= 1.0"
  #  }
 # }
#}

terraform {
  required_version = ">=0.13.0"
}

provider "aws" {
  region = "us-west-2"
  version    = "~> 4.0"
  access_key = "AKIA4FJAY3AIMRUM345F"
  secret_key = "Munesh@143"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["835976747024"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
