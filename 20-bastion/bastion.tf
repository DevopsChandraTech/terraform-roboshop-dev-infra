resource "aws_instance" "bastion_host" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]

  tags = merge(
    local.common_tags,
      {
        Name = "${local.common_name_suffix}"
      } 
  )
}
