resource "aws_instance" "tf_ec2" {
  ami = "ami-0c80e2b6ccb9ad6d1"
  availability_zone = "us-east-2a"
  instance_type = "t2.micro"
  key_name = "VM1-key"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ec2-user
    sudo docker run --name my-crm -p 8080:80 --link mysql:mysql -d espocrm/espocrm
    EOF

  user_data_replace_on_change = true

  tags = {
    Name = "CRM-instance"
  }
}