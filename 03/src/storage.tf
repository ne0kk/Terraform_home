resource "yandex_compute_instance" "storage" {

  name        = var.vm_resource.storage.vm_name #Имя ВМ в облачной консоли
  hostname    = var.vm_resource.storage.vm_name #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = var.vm_resource.storage.platform

  resources {
    cores         = var.vm_resource.storage.cpu
    memory        = var.vm_resource.storage.ram
    core_fraction = var.vm_resource.storage.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_resource.storage.disk_type
      size     = var.vm_resource.storage.disk_size
    }
  }


  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk_vm.*
    content {
      disk_id     = secondary_disk.value["id"]
      device_name = secondary_disk.value["name"]
      auto_delete = var.resource_disk[0].auto_delete
      mode        = var.resource_disk[0].mode
    }
  }

  metadata = local.metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_resource.storage.nat
  }
}