#!/bin/bash

# Обновление системы
sudo apt update
sudo apt upgrade -y

# Установка ROS Noetic (если не установлен)
if ! dpkg -s ros-noetic-desktop-full >/dev/null 2>&1; then
    echo "Установка ROS Noetic..."
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt install -y curl
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    sudo apt update
    sudo apt install -y ros-noetic-desktop-full
    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
    source ~/.bashrc
fi

# Установка необходимых пакетов
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install -y ros-noetic-rplidar-ros ros-noetic-usb-cam ros-noetic-rosserial ros-noetic-imu-tools
sudo apt install -y ros-noetic-rviz ros-noetic-rqt ros-noetic-teleop-twist-keyboard

# Инициализация rosdep
sudo rosdep init
rosdep update

echo "Установка завершена."
