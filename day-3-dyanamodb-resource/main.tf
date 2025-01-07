provider "aws" {
  
}
resource "aws_s3_bucket" "Statefile_bucket" {
    bucket = "demopractice123"
  
}
resource "aws_dynamodb_table" "dyanamodb-terraform-state-lock" {

    name = "terraform-state-lock-dyanamo"
    hash_key = "lockID"
    read_capacity = 20
    write_capacity = 20

    attribute {
        name = "lockID"
        type = "S"
      
    }
  
}
