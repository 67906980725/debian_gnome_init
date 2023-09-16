#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# 默认配置
#  ! 配置中默认了 shell 为 zsh, console 为 gnome 的 kgx, 根据实际情况修改
cp_conf_home ".config/Code/User/settings.json"
#  使用 mg 组合 z 和 code 两个命令, 方便的使用 vscode 打开常用目录
cp_conf_home ".local/bin/mg"
