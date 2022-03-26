resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mvpc.id

  tags = var.internet-gw-tags
}