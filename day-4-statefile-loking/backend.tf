terraform {
  backend "s3" {
    bucket = "newdemo11431"
    key = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dyanamo"
    encrypt = true
    
  }
}