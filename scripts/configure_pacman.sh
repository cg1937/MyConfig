#!/usr/bin/bash
# configure pacman china mirror
sudo pacman-mirrors -c China
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp pacman.conf /etc/
echo "配置完成"
#更新系统
sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm archlinuxcn-keyring
echo "请重启系统..."