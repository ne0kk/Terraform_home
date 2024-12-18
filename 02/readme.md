# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

### Задание 0 (В процессе)

1. Ознакомьтесь с [документацией к security-groups в Yandex Cloud](https://cloud.yandex.ru/docs/vpc/concepts/security-groups?from=int-console-help-center-or-nav). 
Этот функционал понадобится к следующей лекции.

------

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.

   Ответ:+
3. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).

   Ответ:+
5. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.

   Ответ:+
7. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

    Ответ:+

  platform_id = "standard-v4(3)"
  resources {
    cores         = 1(2)
    memory        = 1(2)
    core_fraction = 5(20)
  }
  
9. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
   Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;

   Ответ:
   
![image](https://github.com/user-attachments/assets/859abfec-5b7f-4b41-8d42-9fc82a73ffa3)
![image](https://github.com/user-attachments/assets/24989e34-b8b0-4d3c-83a8-405710a255af)

11. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.
  
   Ответ:
   preemptible = true - выставляет чекбокс на прерываемость, помогает сократить расходы на ВМ за счет того, что ВМ выключется, цена на такие ВМ гораздо ниже. 

   core_fraction=5 - указывает на какое количество мы занимаем русурсы процессора в проуентах, так же сокращает цену за использование такой ВМ. 

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;



### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
     
   Ответ:

   ![image](https://github.com/user-attachments/assets/5f8cff85-8ff9-4c6a-86ee-01e69c956181)

3. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf.
     
   Ответ:
   
   ![image](https://github.com/user-attachments/assets/00d74d08-5e72-41ac-9667-22cfbd4337c9)

5. Проверьте terraform plan. Изменений быть не должно.
     A
   Ответ:
   
![image](https://github.com/user-attachments/assets/1d230f96-d68e-440f-aa1c-1814663642ca)


### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
     
   Ответ:
   
   ![image](https://github.com/user-attachments/assets/ee6fc9b5-4536-4064-b23f-311085e54613)

3. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
    
   Ответ:
   
 ![image](https://github.com/user-attachments/assets/73cd6000-243e-436d-996b-87000c4204c0)
  
5. Примените изменения.
     
   Ответ:
   
![image](https://github.com/user-attachments/assets/68a9ee96-bd36-4eaf-aec8-f5b94a4d874a)
![image](https://github.com/user-attachments/assets/5f6ba33d-4b0d-4ac4-a586-39829ec3b7f1)


### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
     
   Ответ:

   ![image](https://github.com/user-attachments/assets/07fe3a03-4d0e-4cef-9802-5e403d37c695)

3. Примените изменения.
     
   Ответ:
   
![image](https://github.com/user-attachments/assets/3dec012e-41bb-4edd-9477-feb8a60bbb17)

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.


### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
     
   Ответ:

   ![image](https://github.com/user-attachments/assets/c6065e22-f1e9-42d7-bd46-8bc1a587732e)

3. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
     
   Ответ:
   ![image](https://github.com/user-attachments/assets/58402522-a1ed-4d8c-a27f-7c7672f62d5b)

5. Примените изменения.
     
   Ответ:
![image](https://github.com/user-attachments/assets/44f9b6e9-3886-49a4-b284-9828d342f90a)
![image](https://github.com/user-attachments/assets/ce42b555-4478-4808-8495-6eb89343b0cc)


### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
     
   Ответ:

   ![image](https://github.com/user-attachments/assets/a81be811-1c8d-4ed4-9ed1-36ca804501a5)

3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
    
   Ответ:

   ![image](https://github.com/user-attachments/assets/a02912cb-b43b-4373-998f-87049fb0a072)

5. Найдите и закоментируйте все, более не используемые переменные проекта.
    
   Ответ:

   ![image](https://github.com/user-attachments/assets/5a906cee-d3d8-408c-9410-831bed56f4ac)

7. Проверьте terraform plan. Изменений быть не должно.
     
   Ответ:

![image](https://github.com/user-attachments/assets/5dfa302a-01df-4c5b-a85f-3db295fd34d1)

------

## Дополнительное задание (со звёздочкой*)


------
### Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания: 

1. Напишите, какой командой можно отобразить **второй** элемент списка test_list.
     
   Ответ:
![image](https://github.com/user-attachments/assets/068a1e60-5a53-4516-adc3-8c4dc13dd84e)

3. Найдите длину списка test_list с помощью функции length(<имя переменной>).
     
   Ответ:
![image](https://github.com/user-attachments/assets/acfbfcb9-bad7-420c-98c6-ce4706248689)

5. Напишите, какой командой можно отобразить значение ключа admin из map test_map.
      
   Ответ:
   ![image](https://github.com/user-attachments/assets/841c810d-2c27-48ce-b9cc-611c11362bac)

7. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.
      
   Ответ:
"${local.test_map.admin} is ${keys(local.test_map)[0]} for ${keys(local.servers)[1]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} RAM and ${length(local.servers.production.disks)} virtual disks"

![image](https://github.com/user-attachments/assets/d23082ee-532f-4c2e-97f0-b619a6b251b2)

**Примечание**: если не догадаетесь как вычленить слово "admin", погуглите: "terraform get keys of map"

В качестве решения предоставьте необходимые команды и их вывод.

------

### Задание 8*
1. Напишите и проверьте переменную test и полное описание ее type в соответствии со значением из terraform.tfvars:
```
test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
```
![image](https://github.com/user-attachments/assets/58eb35a4-65be-437a-b1b9-6c25d90a4f56)



2. Напишите выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117" из этой переменной.
![image](https://github.com/user-attachments/assets/15c340ea-c04a-4e03-a322-63db67879b4e)

------

### Задание 9* Буду выполнять позже. 

Используя инструкцию https://cloud.yandex.ru/ru/docs/vpc/operations/create-nat-gateway#tf_1, настройте для ваших ВМ nat_gateway. Для проверки уберите внешний IP адрес (nat=false) у ваших ВМ и проверьте доступ в интернет с ВМ, подключившись к ней через serial console. Для подключения предварительно через ssh измените пароль пользователя: ```sudo passwd ubuntu```



### Правила приёма работы
В качестве результата прикрепите ссылку на MD файл с описанием выполненой работы в вашем репозитории. Так же в репозитории должен присутсвовать ваш финальный код проекта.

**Важно. Удалите все созданные ресурсы**.


