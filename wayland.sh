#!/usr/bin/env bash
source ./util_common.sh

install qt6-wayland wl-clipboard 

# QT_QPA_PLATFORM=wayland
# firefox
# MOZ_ENABLE_WAYLAND=1
cp_conf_home ".local/shell/env/wayland"