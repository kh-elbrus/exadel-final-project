resource "aws_security_group" "allow_traffic_to_centos_monitoring" {
  name        = "allow_tf_to_centos_monitoring"
  description = "Allow necessary traffic to centos Grafana"
  vpc_id      = aws_vpc.mvpc.id

  tags = var.allow-traffic-to-centos-monitoring-tags
}

#### Outcommig connections ####

resource "aws_security_group_rule" "out_to_world_monitoring" {
  type = "egress"
  from_port = -1
  to_port = -1
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_monitoring.id
}

#### Incomming connections ####

resource "aws_security_group_rule" "in_to_ssh_monitoring" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.allow_traffic_to_centos_monitoring.id
}

resource "aws_security_group_rule" "in_to_http_monitoring" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_monitoring.id
}

resource "aws_security_group_rule" "in_to_https_monitoring" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_monitoring.id
}

resource "aws_security_group_rule" "in_to_web_panel_monitoring" {
  type = "ingress"
  from_port = 3000
  to_port = 3000
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_centos_monitoring.id
}

