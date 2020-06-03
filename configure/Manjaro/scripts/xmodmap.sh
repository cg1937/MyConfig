#!/usr/bin/bash
# exchange CapsLock and Ctrl-L

xmodmap -pke > ~/.Xmodmap
echo -e "remove Lock = Caps_Lock\nremove Control = Control_L\nkeysym Control_L = Caps_Lock\nkeysym Caps_Lock = Control_L\nadd Lock = Caps_Lock\nadd Control = Control_L" | tee -a ~/.Xmodmap
echo -e "if [ -f $HOME/.Xmodmap ]; then\n    /usr/bin/xmodmap $HOME/.Xmodmap\nfi" | sudo tee ~/.xinitrc
xmodmap ~/.Xmodmap
echo "config has actived! enjoy it!"
