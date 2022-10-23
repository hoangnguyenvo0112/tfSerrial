provider "aws" {
  region = var.region
  access_key = "AKIAUBVLESBOKT35AW5H"
  secret_key = "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"
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ansible_server" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.small" // t3.micro -> t3.small
}
