terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = "~>1.9.4" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host     = "ssh://user@89.169.161.142"
ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

#однострочный комментарий

resource "random_password" "MYSQL_ROOT_PASSWORD" {
  length      = 16
}

#Нет название образа 
resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = false
}

/*Неверное название контейнера, опечатка 
убрать FAKE, большая буква T*/

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql_home"
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.MYSQL_ROOT_PASSWORD.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.MYSQL_ROOT_PASSWORD.result}",
    "MYSQL_ROOT_HOST=%"
    ]
  ports {
    internal = 3306
    external = 3306
  }
}

