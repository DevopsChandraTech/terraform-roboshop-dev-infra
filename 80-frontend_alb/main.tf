#create frontend loadbalancer
#create listener for fronent end loadbalancer listenes 443 to public
#update in route53 record

resource "aws_lb" "frontend_alb" {
  name               = local.common_name_suffix
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.public_subnet_ids

  enable_deletion_protection = true

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-frontend_alb_sg-id"
    }
  )
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06" 
  certificate_arn   = local.frontend_alb_certificate_arn
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi,this is from frontend alb</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "frontend_alb" {
  zone_id = var.zone_id
  name    = "${var.project_name}-${var.environment}.devaws.shop" #roboshop-dev.devaws.shop
  type    = "A"
  allow_overwrite = true

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
}

