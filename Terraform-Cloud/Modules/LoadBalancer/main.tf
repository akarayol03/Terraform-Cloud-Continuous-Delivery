resource "aws_lb" "tfcloud_lb" {
  name               = "tfcloud-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.web_sg]
  subnets            = tolist(var.public_subnet)

  depends_on = [
    var.database_asg
  ]
}

resource "aws_lb_target_group" "tfcloud_tg" {
  name     = "tfcloud-lb-tg-${substr(uuid(), 0, 5)}"
  protocol = var.tg_protocol
  port     = var.tg_port
  vpc_id   = "vpc-0e503ea061a8d3a84"

  health_check {
    healthy_threshold   = var.lb_healthy_threshold
    unhealthy_threshold = var.lb_unhealthy_threshold
    timeout             = var.lb_timeout
    interval            = var.lb_interval
  }
  
  lifecycle {
    create_before_destroy = true
    ignore_changes        =[name]
  }
}

resource "aws_lb_listener" "tfcloud_lb_listener" {
  load_balancer_arn = aws_lb.tfcloud_lb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tfcloud_tg.arn
  }
}