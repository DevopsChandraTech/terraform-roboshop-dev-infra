#bastion host sent traffic from databases and applications
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

resource "aws_security_group_rule" "frontend-bastion" {
  type              = "ingress"
  security_group_id = local.frontend_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.bastion_sg_id #bastion host traffice sends to mongodb
  from_port         = 22
  protocol       = "tcp"
  to_port           = 22
}


#mongodb accepting connections from catalogue and redis
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

#redis accepting connections from user and cart
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

#mysql accepting connections from shipping
resource "aws_security_group_rule" "mysql-shipping" {
  type              = "ingress"
  security_group_id = local.mysql_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.shipping_sg_id #bastion host traffice sends to mongodb
  from_port         = 3306
  protocol       = "tcp"
  to_port           = 3306
}

#rabbitmq accepting connections from payment
resource "aws_security_group_rule" "rabbitmq-payment" {
  type              = "ingress"
  security_group_id = local.rabbitmq_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.payment_sg_id #bastion host traffice sends to mongodb
  from_port         = 5672
  protocol       = "tcp"
  to_port           = 5672
}

#catalogue,user,cart,shipping,payment accepting connections from backend_alb
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

resource "aws_security_group_rule" "backend_alb-cart" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.cart_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "backend_alb-shipping" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id #mongodb traffice receives from bastion
  source_security_group_id = local.shipping_sg_id #bastion host traffice sends to mongodb
  from_port         = 8080
  protocol       = "tcp"
  to_port           = 8080
}

resource "aws_security_group_rule" "backend_alb-payment" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id #mongodb traffice receives from bastion
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



