# mickpav_infra
mickpav Infra repository

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
Создать файл ~/.ssh/config со следующим содержимым:

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
