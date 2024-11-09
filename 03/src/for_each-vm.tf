


resource "yandex_compute_instance" "db" {
  depends_on = [yandex_compute_instance.web]

  for_each = var.each_vm

  name        = each.value.vm_name #Имя ВМ в облачной консоли
  hostname    = each.value.vm_name #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = each.value.platform

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = each.value.disk_type
      size     = each.value.disk_size
    }
  }

  metadata = local.metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat

  }
}


