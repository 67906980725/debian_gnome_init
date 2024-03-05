#!/usr/bin/env bash
# https://wiki.debian.org/VirtualBox#Debian_12_.22Bookworm.22-1
source ./util_common.sh

# 安装依赖
install libqt5opengl5 linux-headers-amd64 linux-headers-$(uname -r)
# 从官网下载安装 deb包
xdg-open https://www.virtualbox.org/wiki/Linux_Downloads

# 安装后执行
# sudo modprobe vboxdrv
# sudo modprobe vboxnetadp
# sudo modprobe vboxnetflt
# sudo usermod -a -G vboxusers $USER

# reboot
