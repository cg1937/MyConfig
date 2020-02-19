echo "安装oh-my-zsh及其插件，并更新配置..."
ZSHRCPATH="~/.zshrc"
#安装 zsh
pacman -S --noconfirm zsh
#安装自动修正命令的插件thefuck
pacman -S --noconfirm thefuck
#安装oh-my-zsh被修改当前用户的默认终端
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
#下载代码提示插件zsh-autosuggestions、代码高亮插件zsh-syntax-highlighting、智能跳转插件autojump
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
pacman -S --noconfirm autojump
#修改并重新载入.zshrc文件
sed -f sedscript $ZSHRCPATH
source $ZSHRCPATH