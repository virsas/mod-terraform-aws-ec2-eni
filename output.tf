output "id" {
  value = try(aws_network_interface.vss.id, "")
}
output "arn" {
  value = try(aws_network_interface.vss.arn, "")
}
output "mac_address" {
  value = try(aws_network_interface.vss.mac_address, "")
}
output "private_dns_name" {
  value = try(aws_network_interface.vss.private_dns_name, "")
}


output "instance_id" {
  value = try(aws_network_interface_attachment.vss.*.instance_id, "")
}
output "network_interface_id" {
  value = try(aws_network_interface_attachment.vss.*.network_interface_id, "")
}
output "attachment_id" {
  value = try(aws_network_interface_attachment.vss.*.attachment_id, "")
}
output "status" {
  value = try(aws_network_interface_attachment.vss.*.status, "")
}