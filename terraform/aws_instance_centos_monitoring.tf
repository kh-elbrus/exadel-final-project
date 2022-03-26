resource "aws_instance" "centos-monitoring" {
  ami           = var.centos-ami
  instance_type = var.instance-type
  key_name = "centos-ssh"
  
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.centos-nic-monitoring.id
  }

  tags = var.centos-monitoring-tags
}