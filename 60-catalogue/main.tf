resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id = local.private_subnet_id
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-mongodb" #roboshop-dev-mongodb
    }
  )
}

resource "terraform_data" "catalogue" { #if instance id replaced it can be triggered
    triggers_replace =  [
      aws_instance.catalogue.id
  ] 


  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      #"sudo sh /tmp/bootstrap.sh"
      "sudo sh /tmp/bootstrap.sh catalogue"
    ]
  }
}