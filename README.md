# Robot Courier Project

## Описание
Данный проект создан для обучающей платформы Skillbox.ru в качестве шаблона для будущих проектов с использованием ROS.
Проект автономного робота-курьера для доставки посылок внутри офисного здания.

## Схема подключения датчиков и исполнительных устройств

Робот оснащен следующими датчиками и устройствами:

• Лидар: RPLIDAR С1M1-R2 подключается по UART через USB-конвертер.

• Камера: Logitech C270 подключается по USB.

• IMU-датчик: модуль GY-6500 на микросхеме MPU-6500 - это 6-ти осевой IMU-сенсор ( 3-х осевой гироскоп + 3-х осевой акселерометр) подключается по I2C.

• Контроллер двигателей колес: На основе микроконтроллера STM32F103 blue pill с двигателями подключается по UART.

• Дисплей: Сенсорный экран подключается по HDMI и USB для тач-сигнала.

• Микрофон и динамик: для голосовых команд и ответов, подключаются по AUX или USB.

• Одноплатный микрокомпьютер: Orange Pi Lite с ОС Linux (Ubuntu 20.04).

### Схема подключения:

+------------------------------------+
|           Orange Pi Lite           |
|                                    |
|   +-----------+    +------------+  |
|   |  USB  |----|  C270 WEBCAM |  |
|   +-----------+    +------------+  |
|                                    |
|   +-----------+    +-----------+   |
|   |  UART  |----|  STM32F103  |---|-< Motor Drivers
|   +-----------+    +-----------+   |
|                                    |
|   +-----------+    +-----------+   |
|   | I2C GPIO  |----|   GY-6500  |   |
|   +-----------+    +-----------+   |
|                                    |
|   +-----------+    +------------+  |
|   |  USB  |----|  RPLIDAR   |  |
|   +-----------+    +------------+  |
|                                    |
|   +-----------+                    |
|   |   HDMI    |----> Display       |
|   +-----------+                    |
|                                    |
|   +-----------+                    |
|   |   Audio   |----> Mic/Speaker   |
|   +-----------+                    |
+------------------------------------+

## Установка

### Требования

- Ubuntu 20.04
- ROS Noetic

### Шаги установки

1. Клонируйте репозиторий:

   bash
   git clone https://github.com/DVlabs-projects/CourierBOT.git
   cd CourierBOT
   
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
   cd CourierBOT
   catkin_make
   source devel/setup.bash
   
## Запуск


### Запуск всех узлов:

bash
roslaunch robot_courier robot_launch.launch

### Запуск с визуализацией в RViz:

bash
roslaunch robot_courier robot_launch.launch rviz:=true

### Запуск с инструментами RQT:

bash
roslaunch robot_courier robot_launch.launch rqt:=true

## Обратная связь

Если у вас есть вопросы или предложения, пожалуйста, свяжитесь с нами свяжитесь с нами по почте [dimeant@mail.ru](mailto:dimeant@mail.ru).


