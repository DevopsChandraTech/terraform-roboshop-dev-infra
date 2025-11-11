# this module using open source
# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false
#   description = "Security group which is used for roboshop project"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value

# }

# this is for custom module:
module "sg" {
  source = "git::https://github.com/DevopsChandraTech/terraform-roboshop-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  description = var.description
  sg_name = var.sg_name
  vpc_id = local.vpc_id

}