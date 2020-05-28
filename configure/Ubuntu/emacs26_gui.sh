#!/bin/bash
# successful on Ubuntu 18.04 WSL
echo "安装相关依赖"
sudo apt-get install -y dbus-x11
sudo apt-get install -y xfce4
sudo apt-get install -y xorg-dev 
sudo apt-get install -y build-essential libncurses5-dev
sudo apt-get install -y libgif-dev libxpm-dev
sudo apt-get install -y libtiff5-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libgnutls28-dev
echo "在profile文件添加相关配置选项"
echo "安装文泉驿-微米黑, 用于设置emacs-cnfonts"
sudo apt-get install -y ttf-wqy-microhei
echo -e "export DISPLAY=:0.0\nexport NO_AT_BRIDGE=1" | sudo tee -a /etc/profile
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt-get install -y emacs26