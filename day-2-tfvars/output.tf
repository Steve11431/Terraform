output "Private_ip" {
  value     = aws_instance.Name.private_ip
  sensitive = true
}
output "public_ip" {
  value = aws_instance.Name.public_ip

}
output "ami_id" {
  value = aws_instance.Name.ami

}
output "region" {
  value = aws_instance.Name.region
  
}