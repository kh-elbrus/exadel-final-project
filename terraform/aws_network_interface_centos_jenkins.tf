resource "aws_network_interface" "centos-nic-jenkins" {
  subnet_id       = aws_subnet.msubnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_traffic_to_centos_jenkins.id]
}