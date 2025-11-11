locals {
    common_name_suffix = "${var.project_name}-${var.environment}" #roboshop-dev
    common_tags = {
        Project = "roboshop"
        Terraform = true
        DontDelete = true
    }
}

locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
}