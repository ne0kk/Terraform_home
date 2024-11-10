
module "marketing" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.vpc_module.network_ids[0]
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = module.vpc_module.subnet_id
  instance_name  = "webs"
  instance_count = 2
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "i.ivanov",
    project = "accounting"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics" {
  source         = "/home/user02/GIT/04/src/modules/analytics/"
  env_name       = "stage"
  network_id     = module.vpc_module.network_ids[0]
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = module.vpc_module.subnet_id
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
  ssh = local.metadata.ssh-keys
}
}

module "vpc_module" {
  source = "/home/user02/GIT/04/src/modules/vpc_module"
  env_name = "network_m"
  default_zone_m = var.default_zone
  v4_cidr_blocks_m = var.default_cidr
  folder_id = var.folder_id
  token = var.token
  cloud_id = var.cloud_id

}