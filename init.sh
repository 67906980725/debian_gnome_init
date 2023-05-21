#!/usr/bin/env bash
# 需要当前用户是常用用户而非root, 并且常用用户账户有root权限

# D="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $(dirname "$0")

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

# mirror
sh ./mirror.sh

# hardware

# cmd
#  base
install unzip fzf fd-find bat exa git wget curl htop proxychains4 bash-completion fonts-powerline net-tools
install neovim neofetch 

cp_conf_home ".config/environment.d/cmd.conf" # EDITOR="nvim"
sh ./zsh.sh
#  net
cp_conf_root "/etc/hosts"

# sys
# sudo sed -i "/root ALL/a $USER\ ALL=(ALL:ALL)\ ALL" /etc/sudoers

# gui
#  xorg
install xclip
sh ./wayland.sh
#  base
sh ./recorder.sh
sh ./theme.sh
sh ./gnome.sh
sh ./fcitx5.sh
sh ./mpv.sh
#  normal
sh ./wechat.sh
sh ./desktop_file.sh
#  office

# runtime
