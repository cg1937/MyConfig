#!/usr/bin/bash
# install chinese input method Sunpinyin and cloudpinyin

sudo pacman -S --noconfirm fcitx-im fcitx-configtool fcitx-cloudyinpin fcitx-sunpinyin
echo "modify the profile file..."
sudo mv /etc/profile /etc/profile.bak
sudo cp profile /etc/
echo "plz log out system to use new input method."
echo "don't forget to use XiaoHe Shuangpin and cloudpinyin!!!"
