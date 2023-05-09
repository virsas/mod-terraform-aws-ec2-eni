provider "aws" {
  profile = var.profile
  region = var.region

  assume_role {
    role_arn = var.assumeRole ? "arn:aws:iam::${var.accountID}:role/${var.assumableRole}" : null
  }
}

resource "aws_network_interface" "vss" {
  subnet_id         = var.subnet_id

  private_ips       = var.private_ips_count == 0 ? var.private_ips : null
  private_ips_count = var.private_ips_count > 0 ? var.private_ips_count : null

  security_groups   = var.security_groups

  tags = {
    Name = var.name
  }
}

resource "aws_network_interface_attachment" "vss" {
  count = var.attach && length(var.instance) != "" ? 1 : 0

  instance_id = var.instance

  network_interface_id = aws_network_interface.vss.id
  device_index         = var.device_index
}