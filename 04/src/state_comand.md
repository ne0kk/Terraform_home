terraform11 state list

terraform state show 'yandex_vpc_network.develop'

terraform state show 'module.test-vm.yandex_compute_instance.vm[0]'

terraform apply -target module.test-vm

terraform apply -target module.test-vm -replace='module.test-vm.yandex_compute_instance.vm[0]'

terraform state show 'module.test-vm.yandex_compute_instance.vm[0]' | grep 'id'

terraform state rm 'module.test-vm.yandex_compute_instance.vm[0]'

terraform import 'module.test-vm.yandex_compute_instance.vm[0]' fhm1g61rfod251rpdeqg #<VM.ID>


terraform11 state show "module.analytics.data.yandex_compute_image.my_image" | grep 'id'
terraform11 state show "module.analytics.yandex_compute_instance.vm[0]" | grep 'id'
terraform11 state show "module.marketing.data.yandex_compute_image.my_image" | grep 'id'
terraform11 state show "module.marketing.yandex_compute_instance.vm[0]" | grep 'id'
terraform11 state show "module.marketing.yandex_compute_instance.vm[1]" | grep 'id'
terraform11 state show "module.vpc_module.yandex_vpc_network.develop" | grep 'id'
terraform11 state show "module.vpc_module.yandex_vpc_subnet.develop" | grep 'id'

terraform11 state rm "module.analytics.data.yandex_compute_image.my_image" 
terraform11 state rm "module.analytics.yandex_compute_instance.vm[0]" 
terraform11 state rm "module.marketing.data.yandex_compute_image.my_image" 
terraform11 state rm "module.marketing.yandex_compute_instance.vm[0]" 
terraform11 state rm "module.marketing.yandex_compute_instance.vm[1]" 
terraform11 state rm "module.vpc_module.yandex_vpc_network.develop" 
terraform11 state rm "module.vpc_module.yandex_vpc_subnet.develop" 

terraform11 import "module.analytics.data.yandex_compute_image.my_image" fd8fo0f5geoe9hlkk3v0
terraform11 import "module.analytics.yandex_compute_instance.vm[0]" fhm3db6o7mpvcn82i306
terraform11 import "module.marketing.data.yandex_compute_image.my_image"  fd8fo0f5geoe9hlkk3v0
terraform11 import "module.marketing.yandex_compute_instance.vm[0]" fhm1qug35dd8rtgctvit
terraform11 import "module.marketing.yandex_compute_instance.vm[1]" fhmtu7go1hhnjkg311r3
terraform11 import "module.vpc_module.yandex_vpc_network.develop" enpdvu6tnnph6n3mfd5b
terraform11 import "module.vpc_module.yandex_vpc_subnet.develop" e9b6eqo0kbbf9521oddd
