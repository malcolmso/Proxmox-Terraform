resource "proxmox_vm_qemu" "server" {
name = "server04"
desc = "Ubuntu Server"
vmid = "200"
target_node = "proxmox01"

agent = 1

#enter the clone template info

clone = "server03"
cores = 2
sockets = 1
cpu = "host"
memory = 2048

network {
  bridge = "vmbr0"
  model = "VirtO (paravirtualized)"
}

#because cloning. the disk statements need to match
disk {
  storage = "local-lvm"
  type = "SCSI"
  size = "60G"
}
}