git config --global user.name "cg1937"
git config --global user.email "522588429@qq.com"
ssh-keygen -t rsa -C "522588429@qq.com"
cat ~/.ssh/id_rsa.pub | xsel --clipboard
# xsel 用于将内容发送到剪切板
echo "the context of id_rsa.pub is send to your clipboard, enjoy it!"
echo "remember use 'ssh -T git@github.com' to test"