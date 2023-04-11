variable "public_subnet" {}
variable "private_subnet" {}
variable "elb" {}
variable "key_name" { default = "mykeypair"}
variable "alb_tg" {default = "arn:aws:elasticloadbalancing:us-east-1:489673539939:targetgroup/tfcloud-lb-tg-22b4a/708e2c71c3672043"}
variable "private_sg" {}
variable "public_sg" {}

variable "bastion_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "database_instance_type" {
  type    = string
  default = "db.t2.micro"
}