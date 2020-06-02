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

while true:
do
    read -r -p "安装文泉驿-微米黑, 用于设置emacs-cnfont(需自行安装) [Y/n] " input
	case $input in
	    [yY][eE][sS]|[yY])
		echo "Yes"
		sudo apt-get install -y ttf-wqy-microhei
	      	;;

	    [nN][oO]|[nN])
		echo "No"
	       	;;

	    *)
	      	echo "Invalid input..."
       		;;
	esac
done

echo "下载Basilisk替代Firefox（WSL ubuntu18.04的解决方案)"
wget http://us.basilisk-browser.org/release/basilisk-latest.linux64.tar.xz
sudo mv basilisk-latest.linux64.tar.xz ~/Downloads/
tar xvJf ~/Downloads/basilisk-latest.linux64.tar.xz
rm basilisk-latest.linux64.tar.xz

echo "在profile文件添加相关配置选项"
echo -e "export DISPLAY=:0.0\nexport NO_AT_BRIDGE=1" | sudo tee -a /etc/profile
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt-get install -y emacs26
