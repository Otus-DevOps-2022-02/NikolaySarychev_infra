# NikolaySarychev_infra
NikolaySarychev Infra repository

# Выполнено ДЗ №3
 - [*] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Выполнено задание по подключению через бастион хост.
 - В мой репозиторий Infra (ветка cloud-bastion) добавлены:
    1. файл setupvpn.sh
    2. конфигурационный файл для подключения к VPN (cloud-bastion.ovpn)
 - Описание получившийся конфигурацию и данные для подключения:

1. If you want connetc with use jump-machine, use command:
ssh -i ~/.ssh/appuser -A -J appuser@"JUMP_HOST appuser@END_HOST

2. If you want create alias with jump-host:

1) Create file "config" to ~/.ssh with next parameters:

Host someinternalserver
    HostName "END_HOST"
    ProxyJump appuser@"JUMP_MACHINE"
    User appuser
    IdentityFIle ~/.ssh/appuser

2) Save this file
3) ssh someinternalhost ----use this command in to Terminal

3. VPC config:
bastion_IP = 51.250.72.150
someinternalhost_IP = 10.128.0.30

## PR checklist
 - [*] Выставил label с номером домашнего задания
 - [*] Выставил label с темой домашнего задания
