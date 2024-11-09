
resource "yandex_compute_disk" "disk_vm" {
  count = var.count_iterrator_disk
  name = "${var.resource_disk[0].name}-${count.index+1}"
  size = var.resource_disk[0].size  
  type = var.resource_disk[0].type_disk
  zone = var.default_zone
}