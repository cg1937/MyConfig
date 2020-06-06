#!/usr/bin/bash
# install apps
#安装vscode emacs
sudo pacman -S --noconfirm visual-studio-code-bin emacs
#安装C/C++相关
sudo pacman -S --noconfirm gcc make pkg-config libv4l cmake gdb
#安装tmux
sudo pacman -S --noconfirm tmux
#安装电报
sudo pacman -S --noconfirm telegram-desktop
#安装字体
sudo pacman -S --noconfirm noto-fonts-cjk noto-fonts-emoji
sudo pacman -S --noconfirm ttf-symbola
sudo pacman -S --noconfirm ttf-roboto noto-fonts ttf-dejavu
sudo pacman -S --noconfirm wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
sudo pacman -S --noconfirm ttf-wps-fonts
sudo pacman -S --noconfirm adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
wget https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.12.6/sarasa-gothic-ttf-0.12.6.7z
7z x sarasa-gothic-ttf-0.12.6.7z -o Sarasa-Gothic/
rm sarasa-gothic-ttf-0.12.6.7z
sudo mv Sarasa-Gothic/ /usr/share/fonts/
cd /usr/share/fonts
sudo mkfontscale
sudo mkfontdir
fc-cache -fv
cd ~/Downloads
#安装chrome
sudo pacman -S --noconfirm google-chrome
#下载SwitchOmega插件
wget https://github.com/FelisCatus/SwitchyOmega/releases/download/v2.5.20/SwitchyOmega_Chromium.crx
mv SwitchyOmega_Chromium.crx SwitchyOmega_Chromium.zip
unzip SwitchyOmega_Chromium.zip
rm SwitchyOmega_Chromium.zip
echo "SwichOmage插件的打包文件夹已经准备好，之后请在chrome中extensions选项中开启开发者模式进行加载安装"
#安装electron-ssr
wget https://github.com/shadowsocksrr/electron-ssr/releases/download/0.3.0-alpha.6/electron-ssr-0.3.0-alpha.6.pacman
sudo pacman -U electron-ssr-0.3.0-alpha.6.pacman
#安装Proxychains代理
sudo pacman -S --noconfirm proxychains-ng
#安装WPS
sudo pacman -S --noconfirm wps-office
#安装Anki
sudo pacman -S --noconfirm anki
