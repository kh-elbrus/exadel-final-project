resource "aws_eip" "ubuntu-web" {
  vpc = true
  network_interface = aws_network_interface.ubuntu-nic.id 
  associate_with_private_ip = "10.0.1.52"
  depends_on = [aws_internet_gateway.gw]
}