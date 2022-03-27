resource "aws_security_group" "allow_traffic_to_ubuntu_jenkins_agent" {
  name        = "allow_tf_to_ubuntu_jenkins_agent"
  description = "Allow necessary traffic to ubuntu Jenkins agent"
  vpc_id      = aws_vpc.mvpc.id

  tags = var.allow-traffic-to-ubuntu-jenkins-agent-tags
}

#### Outgoing connections ####

resource "aws_security_group_rule" "out_to_world_jenkins_agent" {
  type = "egress"
  from_port = -1
  to_port = -1
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.allow_traffic_to_ubuntu_jenkins_agent.id
}

#### Incoming connections ####

resource "aws_security_group_rule" "in_to_all_jenkins_agent" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.allow_traffic_to_ubuntu_jenkins_agent.id
}
