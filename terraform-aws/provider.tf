provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = "us-east-1"
}
    
resource "aws_key_pair" "l1" {
  key_name   = "l1"
  public_key = "${file(".ssh/id_rsa.pub")}"
}

resource "aws_instance" "l1" {
  count = 2

  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = {
    Name = "ubuntu-l1-instance-${count.index}"
  }
}

output "instance_ips" {
  value = ["${aws_instance.l1.*.public_ip}"]
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}
