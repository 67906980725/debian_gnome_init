#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# https://blog.csdn.net/a51509/article/details/123274124

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# sudo tee /etc/apt/sources.list <<-'EOF'
# deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
# # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free
# deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free
# # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free

# deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free
# # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free

# deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
# # deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free
# EOF
cp_conf_root "/etc/apt/sources.list"

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
