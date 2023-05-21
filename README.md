# debian gnome 国内初始化脚本

*提前恢复 .ssh 目录

``` shell
chmod 700 ~/.ssh
chmod 644  ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

mkdir -p $HOME/.local/project/i/sys
cd $HOME/.local/project/i/sys
git@gitee.com:g8307640632/debian_gnome_init.git

cd debian_gnome_init
./init.sh
```

重启后

``` shell
cd $HOME/.local/project/i/sys/debian_gnome_init
sh ./after_reboot.sh
```
