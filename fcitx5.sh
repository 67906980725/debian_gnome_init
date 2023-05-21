#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

install fcitx5 fcitx5-rime fcitx5-table fcitx5-frontend-gtk2 fcitx5-frontend-gtk3 fcitx5-frontend-gtk4 fcitx5-frontend-qt5 fcitx5-frontend-qt6 fcitx5-material-color 
cp -frp /usr/share/applications/org.fcitx.Fcitx5.desktop $HOME/.config/autostart/
cp -frp ./conf/home/.config/fcitx5 $HOME/.config/
cp -frp ./conf/home/.local/share/fcitx5/themes $HOME/.local/share/fcitx5/

# env
# export LANG="zh-CN.UTF-8" 
# export LC_ALL="en_US.UTF-8"
# export GTK_IM_MODULE="fcitx"
# export QT_IM_MODULE"="fcitx"
# export XMODIFIERS"="@im=fcitx"
# export INPUT_METHOD"="fcitx"
# export XIM="fcitx"
# export XIM_PROGRAM="fcitx"
# export GLFW_IM_MODULE="ibus"
cp_conf_home ".config/environment.d/ime.conf"

im-config




# cp_conf_root "/etc/locale.gen"
# sudo locale-gen

# localectl set-locale LANG=zh_CN.UTF-8
# cp_conf_home ".config/locale.conf"

