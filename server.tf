resource "proxmox_vm_qemu" "server" {
  name        = "server04"
  desc        = "Ubuntu Server"
  vmid        = "200"
  target_node = "proxmox01"
  agent       = 1

  # Enter the clone template info
  clone       = "server03"
  cores       = 2
  sockets     = 1
  cpu         = "host"
  memory      = 2048

  # Network configuration
  network {
    bridge = "vmbr0"
    model  = "virtio" 
  }

  # Disk configuration
  disk {
    size         = "60G"
    type         = "scsi"
    storage      = "local-lvm"
    iothread     = 1       # Use 1 instead of true for the number
  }
}
