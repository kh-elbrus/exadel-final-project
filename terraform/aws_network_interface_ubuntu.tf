resource "aws_network_interface" "ubuntu-nic" {
  subnet_id       = aws_subnet.msubnet.id
  private_ips     = ["10.0.1.52"]
  security_groups = [aws_security_group.allow_traffic_to_ubuntu.id]
}