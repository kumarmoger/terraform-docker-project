output "public_ip" {
  value = aws_instance.webserver.public_ip
}

output "ec2_full_info" {
  value = aws_instance.webserver
}

output "private_ip" {
  value = aws_instance.webserver.private_ip
}
