#!/usr/bin/env bash 

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
install gdebi

sh ./cmd_base_config.sh
sh ./zsh.sh
#  net
cp_conf_root "/etc/hosts"
sh ./git.sh
#  android
install adb fastboot

# sys
# sudo sed -i "/root ALL/a $USER\ ALL=(ALL:ALL)\ ALL" /etc/sudoers

# gui
#  xorg
install xclip
sh ./wayland.sh
#  base
install trash-cli
sh ./recorder.sh
sh ./theme.sh
sh ./gnome.sh
sh ./fcitx5.sh
# sh ./syncthing.sh
sh ./mpv.sh
#  normal
sh ./firefox
sh ./wechat.sh
sh ./desktop_file.sh
#  office

sh ./fastgithub.sh

# runtime

sh ./font.sh
