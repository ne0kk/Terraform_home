resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


#WEB__________________________________________________

resource "yandex_compute_instance" "web1" {
  name        = ""
  zone           = ""
  platform_id = ""
  resources {
    cores         = ""
    memory        = ""
    core_fraction = ""
  }
  boot_disk {
    initialize_params {
      image_id = ""
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  
}

#DB-b_____________________________________________________________________________


resource "yandex_compute_instance" "main" {
  name        = ""
  zone           = ""
  platform_id = ""
  resources {
    cores         = ""
    memory        = ""
    core_fraction = ""
  }
  boot_disk {
    initialize_params {
      image_id = ""
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  
}