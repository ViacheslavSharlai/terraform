variable "image_id" {
  type        = string
  description = "The AMI."
  default     = "ami-047e03b8591f2d48a"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "cidr_block_for_vpc" {
  type    = string
  default = "192.168.0.0/16"
}

variable "cidr_block_for_public_subnet_1a" {
  type    = string
  default = "192.168.1.0/24"
}

variable "cidr_block_for_public_subnet_1b" {
  type    = string
  default = "192.168.2.0/24"
}

variable "key_name" {
  type    = string
  default = "AWS_key"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "subnet_1a" {
  type    = string
  default = "eu-central-1a"
}

variable "subnet_1b" {
  type    = string
  default = "eu-central-1b"
}

variable "name_for_alb" {
  type    = string
  default = "alb_test"
}
