resource "aws_eip" "ubuntu-agent" {
  vpc = true
  network_interface = aws_network_interface.ubuntu-nic-jenkins-agent.id 
  associate_with_private_ip = "10.0.1.53"
  depends_on = [aws_internet_gateway.gw]
}