variable "env" {
    description = "This is the environment name (Dev/Staging/Prod)"
    type = string
}

variable "instance_type"{
  description = " this for AWS t2.micro/medium"
  type = string
}

variable "instance_count"{
  description = " this no of instances"
  type = number
}

variable "ami" {
    description = "this is image of OS"
    type = string
 }

 variable "volume_size" {
  description = "volume describe here"
  type = number
 }
