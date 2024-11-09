
output "web" {
  value = tomap({
    for inst in yandex_compute_instance.web : inst.name => {
      name                = inst.name
      id                  = inst.id
      fqdn                = inst.fqdn
    }
  })
}


output "db" {
  value = tomap({
    for inst in yandex_compute_instance.db : inst.name => {
      name                = inst.name
      id                  = inst.id
      fqdn                = inst.fqdn
    }
  })
}
