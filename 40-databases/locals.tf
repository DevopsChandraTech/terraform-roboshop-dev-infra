locals {
    ami_id = data.aws_ami.ami_id.id
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    common_name_suffix = "${var.project_name}-${var.environment}"
    common_tags = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}