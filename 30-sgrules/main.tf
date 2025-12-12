resource "aws_security_group_rule" "backend-alb-bastion" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id #backend alb traffice receives from bastion
  source_security_group_id  = local.bastion_sg_id #bastion host send traffice to backend alb
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "bastion-laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id #backend alb traffice receives from bastion
  cidr_blocks      = ["0.0.0.0/0"] #laptop send traffice to bastion host
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mongodb-bastion" {
  type              = "ingress"
  security_group_id = local.mongodb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "redis-bastion" {
  type              = "ingress"
  security_group_id = local.redis_sg_id #redis traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "rabbitmq-bastion" {
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id #redis traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mysql-bastion" {
  type              = "ingress"
  security_group_id = local.mysql_sg_id #redis traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "catalogue-bastion" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "user-bastion" {
  type              = "ingress"
  security_group_id = local.user_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "cart-bastion" {
  type              = "ingress"
  security_group_id = local.cart_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "shipping-bastion" {
  type              = "ingress"
  security_group_id = local.shipping_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "payment-bastion" {
  type              = "ingress"
  security_group_id = local.payment_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}



resource "aws_security_group_rule" "mongodb-catalogue" {
  type              = "ingress"
  security_group_id = local.mongodb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.catalogue_sg_id #bastion host traffice sends to mongodb
  from_port         = 27017
  protocol       = "tcp"
  to_port           = 27017
}

resource "aws_security_group_rule" "redis-catalogue" {
  type              = "ingress"
  security_group_id = local.redis_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.catalogue_sg_id #bastion host traffice sends to mongodb
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

resource "aws_security_group_rule" "redis-user" {
  type              = "ingress"
  security_group_id = local.redis_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.user_sg_id #bastion host traffice sends to mongodb
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

resource "aws_security_group_rule" "redis-cart" {
  type              = "ingress"
  security_group_id = local.redis_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.cart_sg_id #bastion host traffice sends to mongodb
  from_port         = 6379
  protocol       = "tcp"
  to_port           = 6379
}

resource "aws_security_group_rule" "mysql-shipping" {
  type              = "ingress"
  security_group_id = local.mysql_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.shipping_sg_id #bastion host traffice sends to mongodb
  from_port         = 3306
  protocol       = "tcp"
  to_port           = 3306
}

resource "aws_security_group_rule" "rabbitmq-payment" {
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.payment_sg_id #bastion host traffice sends to mongodb
  from_port         = 5672
  protocol       = "tcp"
  to_port           = 5672
}

resource "aws_security_group_rule" "catalogue-backend_alb" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.backend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "user-backend_alb" {
  type              = "ingress"
  security_group_id = local.user_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.backend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "cart-backend_alb" {
  type              = "ingress"
  security_group_id = local.cart_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.backend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "shipping-backend_alb" {
  type              = "ingress"
  security_group_id = local.shipping_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.backend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "payment-backend_alb" {
  type              = "ingress"
  security_group_id = local.payment_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.backend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "catalogue-cart" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.cart_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "shipping-cart" {
  type              = "ingress"
  security_group_id = local.cart_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.shipping_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "payment-cart" {
  type              = "ingress"
  security_group_id = local.cart_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.payment_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "payment-user" {
  type              = "ingress"
  security_group_id = local.user_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.payment_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "backend_alb-frontend" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.frontend_sg_id #bastion host traffice sends to mongodb
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}


resource "aws_security_group_rule" "frontend-frontend_alb" {
  type              = "ingress"
  security_group_id = local.frontend_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.frontend_alb_sg_id #bastion host traffice sends to mongodb
  from_port         = 80
  protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group_rule" "frontend_alb-public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id #backend alb traffice receives from bastion
  cidr_blocks      = ["0.0.0.0/0"] #laptop send traffice to bastion host
  from_port         = 443
  protocol       = "tcp"
  to_port           = 443
}

