resource "aws_instance" "database" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id = local.private_subnet_id
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-mongodb" #roboshop-dev-mongodb
    }
  )
}
#null resource will not create any resource.but it is used to configure the instance using provisioner. it follows terraform lifecycle.
#null resource is deprecated and now it is used as terraform data

resource "terraform_data" "mongodb" { #if instance id replaced it can be triggered
  triggers_replace = aws_instance.database.id

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = aws_instance.database.private_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo Hello World"
    ]
  }
}