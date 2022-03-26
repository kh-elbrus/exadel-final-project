resource "aws_vpc" "mvpc" {
  cidr_block = "10.0.1.0/24"

  tags = var.main-vpc-tags
}