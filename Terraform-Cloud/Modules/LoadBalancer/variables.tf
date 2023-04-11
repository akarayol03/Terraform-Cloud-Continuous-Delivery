variable "tg_port" {}
variable "tg_protocol" {}
variable "lb_healthy_threshold" {}
variable "lb_unhealthy_threshold" {}
variable "lb_timeout" {}
variable "lb_interval" {}
variable "vpc_id" {default = "vpc-062f84c8e78c2cb23"}
variable "database_asg" {}
variable "public_subnet" {}
variable "web_sg" {}
variable "listener_protocol" {}
variable "listener_port" {}