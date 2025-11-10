resource "aws_vpc_peering_connection" "peering" {
  count = var.is_required_peering ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id #accepter
  vpc_id        = aws_vpc.main.id #requester

  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-peering" #roboshop-dev-private-us-east-1a
    }
  )
}

resource "aws_route" "public_peering" {
  count = var.is_required_peering ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "default_peering" {
  count = var.is_required_peering ? 1 : 0
  route_table_id            = data.aws_route_table.default.id
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}