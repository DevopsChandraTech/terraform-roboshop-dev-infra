locals {
  common_name_suffix = "${var.project_name}-${var.environment}-backend-alb"
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  private_subnet_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
  common_tags = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}