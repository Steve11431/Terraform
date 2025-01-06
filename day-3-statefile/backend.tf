terraform {
  backend "s3" {
    bucket = "newdemo11431"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}