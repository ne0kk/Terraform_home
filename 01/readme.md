### Домашнее задание выполняю без звездочек, что бы не копить долги, но выполнять со звездачками планирую, буду дополнят этот фаил. 

------
# Задание 1
#### 1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
#### 2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
personal.auto.tfvars
#### 3.Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
"result": "KBRRL0F6PkOjk8eo"
#### 4.Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
#### 5.Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
              #Нет название образа 
              resource "docker_image" "nginx" {
                name         = "nginx:latest"
                keep_locally = true
              }
              
              /*Неверное название контейнера, опечатка 
              убрать FAKE, большая буква T*/
              
              resource "docker_container" "nginx" {
                image = docker_image.nginx.image_id
                name  = "example_${random_password.random_string.result}"
              
                ports {
                  internal = 80
                  external = 9090
                }
![image](https://github.com/user-attachments/assets/a0dad42c-19eb-4428-bb16-5a2d37dc00dc)

#### 6.Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.
Ключ -auto-approve опасен тем что выполнение кода без подтверждения не дает нам шанса на дополнительную проверку изменений.
Пригодится данный ключ может для автоматизации внесенных изменений без участия человека. 
Но предполагаю надо продумать механизмы защиты (тесты).
![image](https://github.com/user-attachments/assets/58ae5e0d-cdb9-408c-91fe-5a520bdda237)


#### 7.Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
{
  "version": 4,
  "terraform_version": "1.9.8",
  "serial": 17,
  "lineage": "0e36aa3d-7fa5-b413-b295-41ab996b42b5",
  "outputs": {},
  "resources": [],
  "check_results": null
}


#### 8.Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ, а затем ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )

Образ не был удален из за строчки 

keep_locally = true

Из документации
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.


------
# Задание 2*
Создайте в облаке ВМ. Сделайте это через web-консоль, чтобы не слить по незнанию токен от облака в github(это тема следующей лекции). Если хотите - попробуйте сделать это через terraform, прочитав документацию yandex cloud. Используйте файл personal.auto.tfvars и гитигнор или иной, безопасный способ передачи токена!
Подключитесь к ВМ по ssh и установите стек docker.
Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.
Используя terraform и remote docker context, скачайте и запустите на вашей ВМ контейнер mysql:8 на порту 127.0.0.1:3306, передайте ENV-переменные. Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(name  = "example_${random_password.random_string.result}" , двойные кавычки и фигурные скобки обязательны!)
    environment:
      - "MYSQL_ROOT_PASSWORD=${...}"
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - "MYSQL_PASSWORD=${...}"
      - MYSQL_ROOT_HOST="%"
Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды env. Запишите ваш финальный код в репозиторий.


------
# Задание 3*
Установите opentofu(fork terraform с лицензией Mozilla Public License, version 2.0) любой версии
Попробуйте выполнить тот же код с помощью tofu apply, а не terraform apply.
