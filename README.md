# mickpav_infra
mickpav Infra repository

Выполнено ДЗ №3

В процессе сделано:

- Самостоятельное задание
Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства, проверить работоспособность найденного решения и внести его в README.md в вашем репозитории

Решение.
Воспользуемся переменными среды

set BASTION="158.160.123.184"

set INTERNALHOST="10.128.0.26"

команда - ssh -J appuser@$bastion appuser@$internalhost

- Дополнительная задача

Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства,
чтобы подключение выполнялось по алиасу someinternalhost и внести его в README.md в вашем репозитории

Решение:

Создаnm файл ~/.ssh/config со следующим содержимым:

Host someinternalhost

HostName 10.128.0.26

User appuser

ProxyCommand ssh -A appuser@bastion nc %h %p

Host bastion

HostName 158.160.123.184

User appuser


Теперь, при выполнении команды ssh someinternalhost мы попадаем сразу на внутренний хост

bastion_IP = 158.160.123.184

someinternalhost_IP = 10.128.0.26


ДЗ 4

Деплой приложения

1. Установка и настройка YC CLI на рабочем месте.
2. Развертывание инстанса ВМ в ЯО
3. Развертывание Ruby на ВМ
4. Развертывание MongoDB на ВМ
5. Разверытвание и запуск приложения на ВМ

testapp_IP=158.160.63.190

testapp_port=9292

Самостоятельная работа:
оформлены скрипты:
- install_ruby.sh
- install_mongodb.sh
- deploy.sh

Дополнительное задание

Создание инстанса ВМ с автоматическим деплоем приложения и зависимостей

yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--zone=ru-central1-a \
--metadata-from-file user-data=startup.yaml
