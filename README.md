# Robot Courier Project

## Описание

Проект автономного робота-курьера для доставки посылок внутри офисного здания.

## Схема подключения компонентов

![Схема подключения](docs/connection_diagram.png)

## Установка

### Требования

- Ubuntu 20.04
- ROS Noetic

### Шаги установки

1. Клонируйте репозиторий:

   bash
   git clone https://github.com/yourusername/robotcourierws.git
   cd robotcourierws
   
2. Установите необходимые пакеты:

   bash
   chmod +x install_packages.sh
   ./install_packages.sh
   
3. Настройте удаленный доступ по SSH (опционально):

   bash
   chmod +x setup_ssh.sh
./setup_ssh.sh
   
4. Инициализируйте рабочее пространство ROS:

   bash
   cd robotcourierws
   catkin_make
   source devel/setup.bash
   
## Запуск


### Запуск всех узлов:

bash
roslaunch robotcourier robotlaunch.launch

### Запуск с визуализацией в RViz:

bash
roslaunch robotcourier robotlaunch.launch rviz:=true

### Запуск с инструментами RQT:

bash
roslaunch robotcourier robotlaunch.launch rqt:=true

## Документация

- [Описание пакетов](docs/packages.md)
- [Инструкция по сборке Docker-образа](docs/docker.md)

## Обратная связь

Если у вас есть вопросы или предложения, пожалуйста, свяжитесь с нами свяжитесь с нами по почте [dimeant@mail.ru](mailto:dimeant@mail.ru).


