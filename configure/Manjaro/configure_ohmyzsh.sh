#!/usr/bin/bash
# install oh-my-zsh and its extension
echo "安装oh-my-zsh及其插件，并更新配置..."
ZSHRCPATH="~/.zshrc"
# 安装 zsh
sudo pacman -S --noconfirm zsh
# 安装自动修正命令的插件thefuck
sudo pacman -S --noconfirm thefuck
# 安装oh-my-zsh被修改当前用户的默认终端
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# install p10k(zsh theme)
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# install plugins zsh-autosuggestions, zsh-syntax-highlighting, autojump, and zsh-vi-mode
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode

sudo apt-get install autojump
sudo pacman -S --noconfirm autojump
# 修改并重新载入.zshrc文件
sudo sed -f sedscript $ZSHRCPATH
source $ZSHRCPATH
