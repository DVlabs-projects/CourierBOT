# Базовый образ
FROM ros:noetic-ros-core-focal

# Обновление и установка необходимых пакетов
RUN apt-get update && apt-get install -y 
    ros-noetic-desktop-full
    ros-noetic-rplidar-ros 
    ros-noetic-realsense2-camera 
    ros-noetic-rosserial 
    ros-noetic-imu-tools 
    ros-noetic-usb-cam 
    ros-noetic-rviz 
    ros-noetic-rqt 
    ros-noetic-teleop-twist-keyboard 
    openssh-server 
    && rm -rf /var/lib/apt/lists/*

# Настройка SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# Копирование рабочего пространства
COPY robot_courier_ws /home/robot/robot_courier_ws
WORKDIR /home/robot/robot_courier_ws

# Сборка рабочего пространства
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make"

# Установка переменных окружения
ENV ROS_WS /home/robot/robot_courier_ws
ENV CATKIN_WS /home/robot/robot_courier_ws
ENV ROS_MASTER_URI http://localhost:11311
ENV ROS_PACKAGE_PATH ${ROS_WS}/src:${ROS_PACKAGE_PATH}

# Открытие портов
EXPOSE 22 11311

# Запуск SSH и Bash при старте контейнера
CMD ["/usr/sbin/sshd", "-D"]
