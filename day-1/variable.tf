variable "ami_id" {
    description = "inserting ami value to main .tf"
    type = string
    default = "ami-0fd05997b4dff7aac"
  
}
variable "instance_type" {
    description = "inserying type of instance in main.tf"
    type = string
    default = "t2.nano"
  
}
variable "key_name" {
    description = "inserting key in main.tf"
    type = string
    default = "PracticeDemo"
  
}