resource "proxmox_vm_qemu" "eshop_iac_vm" {

  name        = "eshop-iac-demo"
  target_node = "mar26-group4-eshoponcontainers-devops-bootcamp-int"

  clone = "ubuntu-2404-cloudinit-template"

  vmid = 200

  cores   = 4
  sockets = 1
  memory  = 8192

  agent   = 1
  os_type = "cloud-init"

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "50G"
          storage = "local"
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

  ipconfig0 = "ip=dhcp"

  ciuser = "ubuntu"
}
