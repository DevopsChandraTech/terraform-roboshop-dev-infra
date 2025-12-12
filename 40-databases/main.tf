#mongodb:
resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id = local.database_subnet_id
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
    triggers_replace =  [
      aws_instance.mongodb.id
  ] 


  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = aws_instance.mongodb.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      #"sudo sh /tmp/bootstrap.sh"
      "sudo sh /tmp/bootstrap.sh mongodb"
    ]
  }
}

#redis:
resource "aws_instance" "redis" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.redis_sg_id]
  subnet_id = local.database_subnet_id
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-redis" #roboshop-dev-mongodb
    }
  )
}
#null resource will not create any resource.but it is used to configure the instance using provisioner. it follows terraform lifecycle.
#null resource is deprecated and now it is used as terraform data

resource "terraform_data" "redis" { #if instance id replaced it can be triggered
  triggers_replace =  [
    aws_instance.redis.id
  ] 

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = aws_instance.redis.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh redis"
    ]
  }
}

#rabbitmq:
resource "aws_instance" "rabbitmq" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  subnet_id = local.database_subnet_id
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-rabbitmq" #roboshop-dev-mongodb
    }
  )
}
#null resource will not create any resource.but it is used to configure the instance using provisioner. it follows terraform lifecycle.
#null resource is deprecated and now it is used as terraform data

resource "terraform_data" "rabbitmq" { #if instance id replaced it can be triggered
  triggers_replace =  [
      aws_instance.rabbitmq.id
  ] 


  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = aws_instance.rabbitmq.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh rabbitmq"
    ]
  }
}

#mysql:
resource "aws_instance" "mysql" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id = local.database_subnet_id
  iam_instance_profile = aws_iam_instance_profile.mysql.name
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-mysql" #roboshop-dev-mongodb
    }
  )
}

resource "aws_iam_instance_profile" "mysql" {
  name = "mysql"
  role = "Ec2SsmParameterStoreRole-ReadAccess"
}
#null resource will not create any resource.but it is used to configure the instance using provisioner. it follows terraform lifecycle.
#null resource is deprecated and now it is used as terraform data

resource "terraform_data" "mysql" { #if instance id replaced it can be triggered
  triggers_replace =  [
      aws_instance.mysql.id
  ] 


  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = aws_instance.mysql.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql dev"
    ]
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = var.zone_id
  name    = "mongodb-${var.environment}.${var.domain_name}" #mongodb-dev.devaws.shop
  type    = "A"
  ttl     = 1
  records = [aws_instance.mongodb.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "mysql" {
  zone_id = var.zone_id
  name    = "mysql-${var.environment}.${var.domain_name}" #mysql-dev.devaws.shop
  type    = "A"
  ttl     = 1
  records = [aws_instance.mysql.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = var.zone_id
  name    = "rabbitmq-${var.environment}.${var.domain_name}" #rabbitmq-dev.devaws.shop
  type    = "A"
  ttl     = 1
  records = [aws_instance.rabbitmq.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis-${var.environment}.${var.domain_name}" #redis-dev.devaws.shop
  type    = "A"
  ttl     = 1
  records = [aws_instance.redis.private_ip]
  allow_overwrite = true
}