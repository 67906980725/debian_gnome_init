#!/usr/bin/env bash
source ./util_common.sh

install syncthing
sudo systemctl enable --now syncthing@${USER}.service

# xdg-open http://127.0.0.1:8384 # 刷新一下
# cp_conf_home ".local/share/applications/syncthing_web.desktop"
