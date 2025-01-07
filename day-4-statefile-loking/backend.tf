terraform {
  backend "s3" {
    bucket = "demopractice123"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock-dyanamo"
    encrypt = true
    
  }
}