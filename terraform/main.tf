resource "aws_instance" "webserver" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  security_groups = ["sg-0addcfab477a4ae40"]

  subnet_id = "subnet-005e3389421ad11dc"

  vpc_security_group_ids = ["sg-0addcfab477a4ae40"]

  tags = {
    Name = "Terraform-Docker-Server"
  }

  user_data = <<-EOF
#!/bin/bash
set -e

exec > /var/log/user-data.log 2>&1

apt update -y
apt install -y docker.io git

usermod -aG docker ubuntu

systemctl enable docker
systemctl start docker

cd /home/ubuntu

git clone https://github.com/kumarmoger/terraform-docker-project.git

cd terraform-docker-project/app

docker build -t website .
docker run -d -p 80:80 website
EOF
}