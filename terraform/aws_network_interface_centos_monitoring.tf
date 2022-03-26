resource "aws_network_interface" "centos-nic-monitoring" {
  subnet_id       = aws_subnet.msubnet.id
  private_ips     = ["10.0.1.51"]
  security_groups = [aws_security_group.allow_traffic_to_centos_monitoring.id]
}