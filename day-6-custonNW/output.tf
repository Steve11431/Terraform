output "vpc_id" {
  value = aws_vpc.dev.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "public_instance_public_ip" {
  value = aws_instance.Public_server.public_ip
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "private_instance_private_ip" {
  value = aws_instance.Private_ec2.private_ip
}
