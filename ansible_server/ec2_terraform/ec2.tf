resource "aws_instance" "tf_ec2" {
  ami               = "ami-0c80e2b6ccb9ad6d1"
  availability_zone = "us-east-2a"
  instance_type     = "t2.micro"
  key_name          = "VM1-key"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install ansible
    sudo systemctl start ansible
    sudo systemctl enable ansible
    EOF

  user_data_replace_on_change = true

  tags = {
    Name = "CRM-instance"
  }
}