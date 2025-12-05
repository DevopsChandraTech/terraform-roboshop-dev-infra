resource "aws_lb" "backend_alb" {
  name               = local.common_name_suffix
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = true

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-backend_alb_sg-id"
    }
  )
}

#frontend alb listens port number 80
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Listens in backend alb"
      status_code  = "200"
    }
  }
}