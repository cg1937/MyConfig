pacman -S --noconfirm fcitx fcitx-configtool fcitx-sogoupinyin fcitx-im kcm-fcitx
cat >> ~/.xprofile  <<EOF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
EOF
source ~/.xprofile
#安装typora
pacman -S --noconfirm typora
#安装Krita(绘画软件)
# pacman -S --noconfirm krita
#安装vs code、clion
pacman -S --noconfirm visual-studio-code-bin clion
#安装Filezilla- 免费的 FTP 解决方案
pacman -S --noconfirm filezilla
#安装tmux
pacman -S --noconfirm tmux
#安装git
pacman -S --noconfirm git
#安装电报
pacman -S --noconfirm telegram-desktop
#安装aria2 uget下载工具
pacman -S --noconfirm aria2 uget
#安装中文字体
pacman -S wqy-bitmapfont
pacman -S wqy-microhei
pacman -S wqy-zenhei
#安装更纱字体
wget https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.8.1/sarasa-gothic-ttf-0.8.1.7z
7z x sarasa-gothic-ttf-0.8.1.7z -oSarasa-Gothic/
rm sarasa-gothic-ttf-0.8.1.7z
mv Sarasa-Gothic/ /usr/share/fonts/
cd /usr/share/fonts
mkfontscale
mkfontdir
fc-cache -fv
cd ~/Downloads
#安装chrome
pacman -S --noconfirm google-chrome
#下载SwitchOmega插件
wget https://github.com/FelisCatus/SwitchyOmega/releases/download/v2.5.20/SwitchyOmega_Chromium.crx
mv SwitchyOmega_Chromium.crx SwitchyOmega_Chromium.zip
unzip SwitchyOmega_Chromium.zip
rm SwitchyOmega_Chromium.zip
echo "SwichOmage插件的打包文件夹已经准备好，之后请在chrome中extensions选项中开启开发者模式进行加载安装"
#安装electron-ssr
wget https://github.com/qingshuisiyuan/electron-ssr-backup/releases/download/v0.2.6/electron-ssr-0.2.6.pacman
pacman -U electron-ssr-0.2.6.pacman
#安装网易云音乐
pacman -S --noconfirm netease-cloud-music
#安装C/C++相关
pacman -S --noconfirm gcc make pkg-config libv4l cmake gdb gcc 
#安装截图软件
pacman -S --noconfirm flameshot
#安装搜索工具fzf、ag
pacman -S --noconfirm fzf the_silver_searcher
#安装Proxychains代理
pacman -S --noconfirm proxychains-ng
#安装WPS
pacman -S wps-office
pacman -S ttf-wps-fonts
#安装yay、yaourt
pacman -S --noconfirm yaourt yay
echo "进一步更新pacman"
pacman -Syu 
#安装foxit(PDF阅读软件)
yaourt --confirm foxit
#安装剪贴板软件
yay -S --nonconfirm copyq
#安装Anki
yay -S --nonconfirm anki
