
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_name_image
}

resource "yandex_compute_instance" "web" {
  #depends_on = "" #[yandex_compute_instance.bastion]

  count = var.count_iterrator

  name        = "${var.vm_resource.web.vm_name}-${count.index+1}" #Имя ВМ в облачной консоли
  hostname    = "${var.vm_resource.web.vm_name}-${count.index+1}" #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = var.vm_resource.web.platform

  resources {
    cores         = var.vm_resource.web.cpu
    memory        = var.vm_resource.web.ram
    core_fraction = var.vm_resource.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_resource.web.disk_type
      size     = var.vm_resource.web.disk_size
    }
  }

  metadata = local.metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_resource.web.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
}