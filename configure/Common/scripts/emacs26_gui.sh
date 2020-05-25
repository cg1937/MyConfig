#!/bin/bash
# successful on Ubuntu 18.04LTS WSL
echo "安装依赖"
sudo apt-get install --assume-yes dbus-x11
sudo apt-get install --assume-yes xfce4
sudo apt-get install --assume-yes xorg-dev 
sudo apt-get install --assume-yes build-essential libncurses5-dev
sudo apt-get install --assume-yes libgif-dev libxpm-dev
sudo apt-get install --assume-yes libtiff5-dev
sudo apt-get install --assume-yes libxml2-dev
sudo apt-get install --assume-yes libgnutls28-dev
echo "在profile文件添加相关配置选项"
sudo cat>>/etc/pacman.conf<<EOF
export DISPLAY=:0.0
export NO_AT_BRIDGE=1
EOF
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26