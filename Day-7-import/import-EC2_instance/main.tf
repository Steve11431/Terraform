resource "aws_instance" "name" {
  ami           = "ami-07b69f62c1d38b012"
  instance_type = "t2.micro"
  tags = {
    Name = "TF-import"
  }

}

/* terraform import aws_instance.name i-00bfc36be3e96fdba{instance id}
The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
*/