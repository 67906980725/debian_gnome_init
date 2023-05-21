#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# http://www.taodudu.cc/news/show-5412804.html?action=onClick
# https://github.com/zq1997/deepin-wine
# 连接失败多试几次
wget -O- https://deepin-wine.i-m.dev/setup.sh | sh
sudo apt-get install com.qq.weixin.deepin
# sudo ln -s /opt/apps/com.qq.weixin.deepin/entries/applications/com.qq.weixin.deepin.desktop /usr/share/applications/
cp_conf_home ".local/share/applications/com.qq.weixin.deepin.desktop"

# env WINEPREFIX="$HOME/.deepinwine/Deepin-WeChat" deepin-wine6-stable winecfg