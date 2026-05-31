
variable "ami" {
  description = "Amazon Machine Image"
  default     = "ami-07a00cf47dbbc844c"
}

variable "instance_type" {
  description = "EC2 Machine"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name"
  default     = "kumarl"
}