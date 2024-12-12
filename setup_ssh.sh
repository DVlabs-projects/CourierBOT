#!/bin/bash

# Установка сервера SSH
sudo apt update
sudo apt install -y openssh-server

# Включение и запуск сервиса SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Проверка статуса SSH
sudo systemctl status ssh

echo "Удаленный доступ по SSH настроен."
