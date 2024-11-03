#Начало блока переменных из ДЗ

###WEB-A
variable "zone-a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr-a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_platform" {
  type        = string
  default     = "platform"
}

/*Блок комментариев
variable "vm_web_core" {
  type        = number
  default     = 2
  #description = "VPC network & subnet name"
}

variable "vm_web_memory" {
  type        = number
  default     = 2
  #description = "VPC network & subnet name"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  #description = "VPC network & subnet name"
}
*/

variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  #description = "VPC network & subnet name"
}

###DB-B______________________________________________________________

variable "zone-b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr-b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_db" {
  type        = string
  default     = "db"
}

/*Блок комментариев
variable "vm_db_core" {
  type        = number
  default     = 2
  #description = "VPC network & subnet name"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  #description = "VPC network & subnet name"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  #description = "VPC network & subnet name"
}
*/

variable "vm_db_platform" {
  type        = string
  default     = "standard-v3"
  #description = "VPC network & subnet name"
}


#Метадата

variable "vms_metadata" {
  type = map(object({
    serial-port-enable = number
    ssh-keys  = string
    }))
  default = {
    "vms" = {
      serial-port-enable = 1
      ssh-keys  = "ubuntu:ssh-rsa AAAAB....."
    }
  }
}

#Блок для определения ресурсов ВМ
variable "vms_resources" {
  type = map(object({
    core = number
    memory  = number
    core_fraction = number
  }))
  default = {
    "web" = {
      core = 2
      memory  = 2
      core_fraction = 20
    },
    "db" = {
      core = 2
      memory  = 2
      core_fraction = 20
    }
  }
}