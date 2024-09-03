#!/bin/bash
# successful on Ubuntu 18.04 WSL
echo "备份原有的镜像源配置"
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "配置清华源..."
sudo cat>>~/sources.list<<EOF
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
EOF
sudo mv ~/sources.list /etc/apt/
sudo apt-get update && sudo apt-get -y upgrade
echo "更新完成"
echo "添加windows字体, 刷新字体缓存"
sudo mkdir /usr/share/fonts/windows
sudo cp -r /mnt/c/Windows/Fonts/*.ttf /usr/share/fonts/windows/
sudo apt-get install -y fontconfig
fc-cache
echo "修正raw.githubusercontent.com DNS污染问题"
echo "199.232.68.133 raw.githubusercontent.com" | tee -a /etc/hosts
echo "安装screenfetch并打印系统信息"
sudo apt-get install -y screenfetch
screenfetch