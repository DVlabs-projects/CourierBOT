# Сборка Docker-образа

## Предварительные требования

- Docker должен быть установлен на вашей системе.

## Шаги сборки

1. Перейдите в корневую папку проекта, где находится Dockerfile.

   bash
   cd robotcourierws
   
2. Сборка Docker-образа:

   bash
   docker build -t robot_courier:latest .
   
3. Запуск контейнера:

   bash
   docker run -it --name robotcouriercontainer --net=host robot_courier:latest
   
   Опция --net=host позволяет использовать сетевые интерфейсы хоста, что полезно для ROS.

## Подключение к контейнеру по SSH

1. Узнайте IP-адрес контейнера:

   bash
   docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' robotcouriercontainer
2. Подключитесь по SSH:

   bash
   ssh root@<IP-адрес контейнера>
   
   Пароль: password

## Запуск ROS внутри контейнера

1. Подключитесь к контейнеру или запустите интерактивную сессию:

   bash
   docker exec -it robotcouriercontainer /bin/bash
   
2. Запустите ROS-корневой узел:

   bash
   roscore
   
3. В новом терминале (или через SSH) запустите LAUNCH-файл:

   bash
   roslaunch robotcourier robotlaunch.launch
