#!/usr/bin/env bash
#  base
source ./util_common.sh

install unzip fzf fd-find bat exa git wget curl htop proxychains4 bash-completion fonts-powerline net-tools
install neofetch 
install gdebi

# 默认用户目录使用英文
# mkdir -p $HOME/{Desktop,Downloads,Templates,Public,Documents,Music,Pictures,Videos}
# cp_conf_home ".config/user-dirs.locale"
# cp_conf_home ".config/user-dirs.dirs"
# sed -i 's@$HOME@'$HOME'@g' "$HOME/.config/user-dirs.dirs"
# https://wiki.archlinux.org/title/XDG_user_directorie
LC_ALL=C xdg-user-dirs-update --force
