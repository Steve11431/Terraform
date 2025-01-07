resource "aws_instance" "Name" {
  ami           = var.ami_id
  instance_type = var.type
  key_name      = var.key


  tags = {
    Name = "Demo_Server"
  }
}
