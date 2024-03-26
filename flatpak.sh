#!/usr/bin/env bash
source ./util_common.sh

install flatpak gnome-software-plugin-flatpak

# 国内源
flatpak remote-add --if-not-exists flathub https://mirror.sjtu.edu.cn/flathub/flathub.flatpakrepo
flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
flatpak repair

# 需要重启
sudo reboot

# Platform 下载失败时可以重试一次
# 不需要 软件有依赖时会自己安装
# sudo flatpak install org.freedesktop.Platform.GL.default # 20.08
# flatpak install org.freedesktop.Platform.openh264 org.gnome.Platform.Locale org.gnome.Platform

# 权限管理
flatpak install com.github.tchx84.Flatseal
# 应用管理
flatpak install io.github.flattool.Warehouse

# qq
flatpak install com.qq.QQ 
# 微信
# https://github.com/web1n/wechat-universal-flatpak
# wps
flatpak install com.wps.Office