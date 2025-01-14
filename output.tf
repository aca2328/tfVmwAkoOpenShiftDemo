output "ubuntu_ip" {
  value = var.dhcp == false ? var.ubuntu_ip4_addresses.* : vsphere_virtual_machine.ubuntu.*.default_ip_address
}

output "dns_ip" {
  value = var.dhcp == false ? split("/", var.ubuntu_ip4_addresses[-1])[0] : vsphere_virtual_machine.dns[0].default_ip_address
}

output "ubuntu_username" {
  value = var.ubuntu.username
}

output "ubuntu_password" {
  value = var.ubuntu_password == null ? random_string.ubuntu_password.result : var.ubuntu_password
}

output "dns_username" {
  value = var.ubuntu.username
}

output "dns_password" {
  value = var.ubuntu_password == null ? random_string.ubuntu_password.result : var.ubuntu_password
}

output "ssh_private_key_path" {
  value = "~/.ssh/${var.ssh_key.private_key_name}.pem"
}

output "ssh_connect_to_dns" {
  value = var.dhcp == false ? "ssh -i ~/.ssh/${var.ssh_key.private_key_name}.pem -o StrictHostKeyChecking=no ubuntu@${split("/", var.ubuntu_ip4_addresses[-1])[0]}" : "ssh -i ~/.ssh/${var.ssh_key.private_key_name}.pem -o StrictHostKeyChecking=no ubuntu@${vsphere_virtual_machine.dns[0].default_ip_address}"
}