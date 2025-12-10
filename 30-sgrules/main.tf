resource "aws_security_group_rule" "bastion-backend-alb" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id #backend alb traffice receives from bastion
  source_security_group_id  = local.bastion_sg_id #bastion host send traffice to backend alb
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "laptop-bastion" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id #backend alb traffice receives from bastion
  cidr_blocks      = ["0.0.0.0/0"] #laptop send traffice to bastion host
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "bastion-mongodb" {
  type              = "ingress"
  security_group_id = local.mongodb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "bastion-redis" {
  type              = "ingress"
  security_group_id = local.redis_sg_id #redis traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "bastion-rabbitmq" {
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id #redis traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "bastion-mysql" {
  type              = "ingress"
  security_group_id = local.mysql_sg_id #redis traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "bastion-catalogue" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}


resource "aws_security_group_rule" "catalogue-mongodb" {
  type              = "ingress"
  security_group_id = local.mongodb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.catalogue_sg_id #bastion host traffice sends to mongodb
  from_port         = 27017
  protocol       = "tcp"
  to_port           = 27017
}

resource "aws_security_group_rule" "backend_alb-catalogue" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.backend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

