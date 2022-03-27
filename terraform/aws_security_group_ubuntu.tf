resource "aws_security_group" "allow_traffic_to_ubuntu" {
  name        = "allow_tf_to_ubuntu"
  description = "Allow necessary traffic to Wagtail"
  vpc_id      = aws_vpc.mvpc.id

  tags = var.allow-traffic-to-ubuntu-tags
}

#### Outcommig connections ####

resource "aws_security_group_rule" "out_to_world_ubuntu" {
  type = "egress"
  from_port = -1
  to_port = -1
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

#### Incomming connections ####

resource "aws_security_group_rule" "in_to_ssh_ubuntu" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "in_to_http_ubuntu" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "in_to_https_ubuntu" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}

resource "aws_security_group_rule" "in_to_https_ubuntu_prom" {
  type = "ingress"
  from_port = 9090
  to_port = 9090
  protocol = "tcp"
  cidr_blocks = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu.id
}
