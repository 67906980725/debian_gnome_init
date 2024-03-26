#!/usr/bin/env bash
source ./util_common.sh

## origin
# https://github.com/web1n/wechat-universal-flatpak
# https://github.com/lovechoudoufu/wechat_for_linux


## wine
# http://www.taodudu.cc/news/show-5412804.html?action=onClick
# https://github.com/zq1997/deepin-wine
# 连接失败多试几次
wget -O- https://deepin-wine.i-m.dev/setup.sh | sh
sudo apt-get install com.qq.weixin.deepin
# sudo ln -s /opt/apps/com.qq.weixin.deepin/entries/applications/com.qq.weixin.deepin.desktop /usr/share/applications/
cp_conf_home ".local/share/applications/com.qq.weixin.deepin.desktop"

# 如果无法发送照片
install libjpeg62:i386

# 修改 wine 设置
# env WINEPREFIX="$HOME/.deepinwine/Deepin-WeChat" deepin-wine6-stable winecfg
