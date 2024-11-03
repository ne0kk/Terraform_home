###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gv3i9qq3bt8g400fs4"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g4oj1qbocerk58ophh"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

/* 
###ssh vars
#для настройки SHH подключения к ВМ
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3...."
  description = "ssh-keygen -t ed25519"
}
*/


#Блок образа
variable "vm_web_name_image" {
  default     = "ubuntu-2004-lts"
  #description = "VPC network & subnet name"
}

variable "project_name" {
  default     = "development"
}

variable "version_project" {
  default     = "01"
}
