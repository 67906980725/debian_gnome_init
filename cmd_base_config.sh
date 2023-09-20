#!/usr/bin/env bash

source ./cp_conf.sh

# xdg 路径
cp_conf_home ".config/environment.d/xdg.conf"
# 命令行常用配置
cp_conf_home ".config/environment.d/cmd.conf"

# 默认用户目录使用英文
# mkdir -p $HOME/{Desktop,Downloads,Templates,Public,Documents,Music,Pictures,Videos}
# cp_conf_home ".config/user-dirs.locale"
# cp_conf_home ".config/user-dirs.dirs"
# sed -i 's@$HOME@'$HOME'@g' "$HOME/.config/user-dirs.dirs"
# https://wiki.archlinux.org/title/XDG_user_directorie
LC_ALL=C xdg-user-dirs-update --force
