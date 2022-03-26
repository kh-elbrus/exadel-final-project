resource "aws_route_table" "mroute-table" {
  vpc_id = aws_vpc.mvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = var.mroute-table-tags
}