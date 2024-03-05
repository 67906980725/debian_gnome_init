#!/usr/bin/env bash 
# D="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $(dirname "$0")
source ./util_common.sh

# mirror
sh ./mirror.sh

# hardware

# cmd-base
sh ./base.sh
sh ./github_proxy.sh
sh ./git.sh
sh ./shell.sh

# cmd-net
# cp_conf_root "/etc/hosts"
install adb fastboot

# sys
# sudo sed -i "/root ALL/a $USER\ ALL=(ALL:ALL)\ ALL" /etc/sudoers

# gui-xorg
install xclip
sh ./wayland.sh

# gui-base
install trash-cli
sh ./ime.sh
sh ./recorder.sh
sh ./gnome.sh
# sh ./syncthing.sh
sh ./mpv.sh

# gui-normal
sh ./firefox
sh ./wechat.sh
sh ./desktop_file.sh
#  office

sh ./fastgithub.sh

# runtime

sh ./font.sh
