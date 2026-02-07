variable "ec2_instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t3.micro"
}


variable "root_storage_size" {
  description = "The size of the root storage volume in GB"
  type        = number
  default     = 8
}

variable "ec2_ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0ff5003538b60d5ec" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}
