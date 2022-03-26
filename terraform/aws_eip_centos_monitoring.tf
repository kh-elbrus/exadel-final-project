resource "aws_eip" "cent-monitoring" {
  vpc = true
  network_interface = aws_network_interface.centos-nic-monitoring.id 
  associate_with_private_ip = "10.0.1.51"
  depends_on = [aws_internet_gateway.gw]
}
