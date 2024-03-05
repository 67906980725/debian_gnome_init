#!/usr/bin/env bash
# 输入法
# https://fcitx-im.org/wiki/Input_method_related_environment_variables/zh-hans
source ./util_common.sh

install fcitx5 fcitx5-rime fcitx5-table fcitx5-frontend-gtk2 fcitx5-frontend-gtk3 fcitx5-frontend-gtk4 fcitx5-frontend-qt5 fcitx5-frontend-qt6 fcitx5-material-color

cp -frp ./conf/home/.config/fcitx5 $HOME/.config/
cp -frp ./conf/home/.local/share/fcitx5/themes $HOME/.local/share/fcitx5/

# env
# export LANG="zh-CN.UTF-8" 
# export LC_ALL="en_US.UTF-8"
# export GTK_IM_MODULE="fcitx"
# export QT_IM_MODULE="fcitx"
# export XMODIFIERS="@im=fcitx"
# export INPUT_METHOD="fcitx"
# export XIM="fcitx"
# export XIM_PROGRAM="fcitx"
# export GLFW_IM_MODULE="ibus"
cp_conf_home ".local/shell/rc/ime"

# wslg ubuntu中需要用服务的方式启动，但在实体机debian中以服务方式启动后无法显示文字及候选框
# cp_conf_home ".config/systemd/user/fcitx5.service"
# systemctl enable --user --now fcitx5 # 禁用: systemctl disable --now --user fcitx5
# 实体机debian中只能以autostart的方式启动
cp -f /usr/share/applications/org.fcitx.Fcitx5.desktop $HOME/.config/autostart/

im-config




# cp_conf_root "/etc/locale.gen"
# sudo locale-gen

# localectl set-locale LANG=zh_CN.UTF-8
# cp_conf_home ".config/locale.conf"

