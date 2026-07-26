variable "instance_type" {
    description = "The type of instance to create"
    type        = string
    default     = "t3.micro"
  
}
variable "ami" {
    description = "The AMI ID to use for the instance"
    type        = string
    default     = "ami-09d88f7c4c272b0c5"
}