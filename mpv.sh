#!/usr/bin/env bash
source ./util_common.sh

install mpv
# 防止播放中自动熄/锁屏
sudo sed -i 's/^Exec=/Exec=gnome-session-inhibit /' /usr/share/applications/mpv.desktop

cp_conf_home ".config/mpv"
# mpv实现简单音乐/视频音乐随机播放 (需要修改音乐目录)
cp_conf_home ".local/script/mp"
