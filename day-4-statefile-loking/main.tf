resource "aws_instance" "name" {
     ami = var.ami_id
    instance_type = var.type
    key_name = var.key
    availability_zone = "ap-south-1a"
    tags = {
        Name="Windows"
    }
  
}