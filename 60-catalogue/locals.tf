locals {
    ami_id = data.aws_ami.ami_id.id
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0] #["10.0.1.0/24","10.0.2.0/24"] its comes with list we split that list
    private_subnet_ids = data.aws_ssm_parameter.private_subnet_ids.value
    backend_alb_listener_rule = data.aws_ssm_parameter.backend_alb_listener_rule.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_name_suffix = "${var.project_name}-${var.environment}" #roboshop-dev
    common_tags = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}
