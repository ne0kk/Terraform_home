output "test" {

  value = [
    { WEB = [
        "external_ip = ${yandex_compute_instance.platform.network_interface[0].nat_ip_address}", 
        "local_ip = ${yandex_compute_instance.platform.network_interface[0].ip_address}", 
        "fqdn = ${yandex_compute_instance.platform.fqdn}",
        "instance_name = ${yandex_compute_instance.platform.name}"
        ]},
    { DB = [
        "external_ip = ${yandex_compute_instance.db.network_interface[0].nat_ip_address}", 
        "local_ip = ${yandex_compute_instance.db.network_interface[0].ip_address}", 
        "instance_name = ${yandex_compute_instance.db.name}",
        "fqdn = ${yandex_compute_instance.db.fqdn}"
        ] }
    
  ]
}