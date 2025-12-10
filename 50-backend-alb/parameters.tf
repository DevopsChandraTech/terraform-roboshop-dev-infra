resource "aws_ssm_parameter" "backend_alb_listener_rule" {
  name  = "/${var.project_name}/${var.environment}/backend_alb_listener_rule"
  type  = "String"
  value = aws_lb.backend_alb.arn
}
