locals {
    ami_id = data.aws_ami.ami_id.id
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}

locals {
    common_name = "${var.project_name}-${var.environment}"
    common_tags = {
        Project = "roboshop"
        Terraform = "true"
    }
    common_name_suffix = "${local.common_name}-bastion"
}