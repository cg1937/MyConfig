pacman-mirrors -c China
echo "配置中科大archlinuxcn源和清华arch4edu源..."
cat>>/etc/pacman.conf<<EOF
[archlinuxcn] 
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch
[arch4edu]
SigLevel = Never
Server = http://mirrors.tuna.tsinghua.edu.cn/arch4edu/\$arch
EOF
echo "配置完成"
#更新系统
pacman -Syyu
pacman -S archlinuxcn-keyring
echo "请重启系统..."