resource "aws_instance" "ubuntu-jenkins-agent" {
  ami           = var.ubuntu-ami
  instance_type = var.instance-type
  key_name = "ubuntu-ssh"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.ubuntu-nic-jenkins-agent.id
  }

  tags = var.ubuntu-jenkins-agent-tags
}