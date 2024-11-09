resource  "local_file" "ansible_inventory"{
content = templatefile("${path.module}/host.tftpl", 
            {
            web = yandex_compute_instance.web
            db = yandex_compute_instance.db
            storage    = yandex_compute_instance.storage.*
            })
filename = "${abspath(path.module)}/host.cfg"
}