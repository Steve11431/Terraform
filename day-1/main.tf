resource "aws_instance" "dev" {
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.nano"
    key_name = "PracticeDemo"
    availability_zone = "ap-south-1a"
    tags = {
        Name="dev"
    }

}