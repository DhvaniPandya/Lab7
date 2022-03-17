resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
    azurerm_linux_virtual_machine.linux_machine
  ]

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file("${var.private_key}")
      host        = element(azurerm_linux_virtual_machine.linux_machine[*].public_ip_address, count.index + 1)
    }
  }

}

