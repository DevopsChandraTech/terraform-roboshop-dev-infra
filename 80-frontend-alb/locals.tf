locals {
  common_name_suffix = "${var.project_name}-${var.environment}-frontend-alb"
  frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
  frontend_alb_certificate_arn = data.aws_ssm_parameter.frontend_alb_certificate_arn.value
  public_subnet_ids = split("," , data.aws_ssm_parameter.public_subnet_ids.value)
  common_tags = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}