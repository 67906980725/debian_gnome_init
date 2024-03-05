#!/usr/bin/env bash
source ./util_common.sh

install flatpak

flatpak remote-add --if-not-exists flathub https://mirror.sjtu.edu.cn/flathub/flathub.flatpakrepo
flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
flatpak repair

sudo flatpak install org.freedesktop.Platform.GL.default # 20.08
flatpak install org.freedesktop.Platform.openh264 org.gnome.Platform.Locale org.gnome.Platform
flatpak install com.github.tchx84.Flatseal # 权限管理
flatpak install io.github.flattool.Warehouse # 应用管理

flatpak install com.qq.QQ

