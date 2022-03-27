resource "aws_network_interface" "ubuntu-nic-jenkins-agent" {
  subnet_id       = aws_subnet.msubnet.id
  private_ips     = ["10.0.1.53"]
  security_groups = [aws_security_group.allow_traffic_to_ubuntu_jenkins_agent.id]
}