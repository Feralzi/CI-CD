resource "aws_instance" "tf_ec2" {
  ami = "ami-0c80e2b6ccb9ad6d1"
  availability_zone = "us-east-2a"
  instance_type = "t2.micro"
  key_name = "VM1-key"

  tags = {
    Name = "CRM-instance"
  }
}