#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh


install qt6-wayland wl-clipboard 

# QT_QPA_PLATFORM=wayland
# firefox
# MOZ_ENABLE_WAYLAND=1
cp_conf_home ".config/environment.d/wayland.conf"