##Этот файл для 7 задания!!
locals {

  test_list = ["develop", "staging", "production"]

  test_map = {
    admin = "John"
    user  = "Alex"
  }

  servers = {
    develop = {
      cpu   = 2
      ram   = 4
      image = "ubuntu-21-10"
      disks = ["vda", "vdb"]
    },
    stage = {
      cpu   = 4
      ram   = 8
      image = "ubuntu-20-04"
      disks = ["vda", "vdb"]
    },
    production = {
      cpu   = 10
      ram   = 40
      image = "ubuntu-20-04"
      disks = ["vda", "vdb", "vdc", "vdd"]
    }
  }
}

#"${local.test_map.admin} is ${keys(local.test_map)[0]} for ${keys(local.servers)[1]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} RAM and ${length(local.servers.production.disks)} virtual disks"

locals {

  test = {
    dev1 = {
      ssh = "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117"
      local_ip ="10.0.1.7"
   },
    dev2 = {
      ssh = "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88"
      local_ip ="10.0.2.29"
    },
    prod1 = {
      ssh = "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101"
      local_ip ="10.0.1.30"
    }
  }
}
