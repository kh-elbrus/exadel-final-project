resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.msubnet.id
  route_table_id = aws_route_table.mroute-table.id
}