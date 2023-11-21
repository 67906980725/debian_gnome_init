#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install mpv
sudo sed -i 's/^Exec=/Exec=gnome-session-inhibit /' /usr/share/applications/mpv.desktop

cp_conf_home ".config/mpv"
# mpv实现简单音乐/视频音乐随机播放 (需要修改音乐目录)
cp_conf_home ".local/bin/mp"
