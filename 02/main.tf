resource "yandex_vpc_network" "develop" {
  name = "develop"
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_name_image
}

resource "yandex_vpc_subnet" "platform" {
  name           = var.vpc_name_platform
  zone           = var.zone-a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr-a
}

resource "yandex_compute_instance" "platform" {
  name        = local.platform
  zone           = var.zone-a
  platform_id = var.vm_web_platform
  resources {
    cores         = var.vms_resources.web.core
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.platform.id
    nat       = true
  }

  metadata = var.vms_metadata.vms

}

#DB-b_____________________________________________________________________________

resource "yandex_vpc_subnet" "db" {
  name           = var.vpc_name_db
  zone           = var.zone-b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr-b
}

resource "yandex_compute_instance" "db" {
  name        = local.db
  zone           = var.zone-b
  platform_id = var.vm_db_platform
  resources {
    cores         = var.vms_resources.db.core
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = true
  }

  metadata = var.vms_metadata.vms
}
