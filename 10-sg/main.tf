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
  count = length(var.sg_names)
  source = "git::https://github.com/DevopsChandraTech/terraform-roboshop-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  vpc_id = local.vpc_id
  description = "this module for ${var.sg_names[count.index]}"
}

#this security group rule allows traffice to frontend ec2 to frontend alb
resource "aws_security_group_rule" "frontend-frontend-alb" {
  type              = "ingress"
  security_group_id = module.sg[9].sg_id #frontend sg_id
  source_security_group_id  = module.sg[11].sg_id #frontend alb sg_id
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}


