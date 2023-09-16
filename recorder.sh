#!/usr/bin/env bash

source ./install.sh

# flameshot 截图命令： flameshot gui
install flameshot xdg-desktop-portal grim 
# install xdg-desktop-portal-wlr

# obs必要设置: 
#    `来源或预览上右击`-`变换`-`拉伸到全屏`; 
#    `文件-设置-输出-输出模式-高级`; 
#    `输出-录像-格式` 设为 `mp4` (便于分享时在线预览)
install obs-studio
