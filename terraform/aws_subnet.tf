resource "aws_subnet" "msubnet" {
  vpc_id     = aws_vpc.mvpc.id
  cidr_block = "10.0.1.0/24"

  tags = var.msubnet-tags
}
