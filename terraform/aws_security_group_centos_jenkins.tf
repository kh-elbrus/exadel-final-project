resource "aws_security_group" "allow_traffic_to_centos_jenkins" {
  name        = "allow_tf_to_centos_jenkins"
  description = "Allow necessary traffic to centos Jenkins"
  vpc_id      = aws_vpc.mvpc.id

  tags = var.allow-traffic-to-centos-jenkins-tags
}

#### Outgoing connections ####

resource "aws_security_group_rule" "out_to_world_jenkins" {
  type = "egress"
  from_port = -1
  to_port = -1
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}

#### Incoming connections ####

resource "aws_security_group_rule" "in_to_ssh_jenkins" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}

resource "aws_security_group_rule" "in_to_http_jenkins" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}

resource "aws_security_group_rule" "in_to_https_jenkins" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}

resource "aws_security_group_rule" "in_to_web_panel_jenkins" {
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}

resource "aws_security_group_rule" "in_to_master_jenkins" {
  type = "ingress"
  from_port = 50000
  to_port = 50000
  protocol = "tcp"
  cidr_blocks = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}

resource "aws_security_group_rule" "in_to_master_jenkins_prom" {
  type = "ingress"
  from_port = 9090
  to_port = 9090
  protocol = "tcp"
  cidr_blocks = [aws_vpc.mvpc.cidr_block]

  security_group_id = aws_security_group.allow_traffic_to_centos_jenkins.id
}
