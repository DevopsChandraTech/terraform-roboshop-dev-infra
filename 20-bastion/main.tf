resource "aws_instance" "terraform" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.bastion.name
  
  user_data = file("bastion.sh")
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-bastion"
    }
  )
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "bastionterraformadmin"
}