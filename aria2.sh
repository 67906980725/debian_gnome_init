#!/usr/bin/env bash
source ./util_common.sh
# https://wiki.archlinuxcn.org/wiki/Aria2

# sh ./github_proxy.sh


# 安装 aria2c 和 ariang
install aria2

# 默认配置 https://zhuanlan.zhihu.com/p/418276041
cp_conf_home ".config/aria2"

# 添加服务并启动 https://man.archlinux.org/man/systemd.unit.5
# https://wiki.archlinuxcn.org/wiki/Systemd
cp_conf_home ".config/systemd/user/aria2.service"
systemctl enable --now --user aria2.service
#systemctl disable --now --user aria2.service 


# install_path="$HOME/.config/aria2"
# # aria ng  可以用浏览器扩展 aria2 explorer 代替
# ng_ver="1.3.6" # 版本
# # 压缩包名
# zip_name="AriaNg-${ng_ver}-AllInOne.zip"
# # 下载解压移动到安装目录后删除压缩包
# wget "${GITHUB_PROXY}https://github.com/mayswind/AriaNg/releases/download/$ng_ver/$zip_name"
# unzip "$zip_name"
# rm -f "$zip_name"
# rm -f "LICENSE"
# mv -f "index.html" "$install_path/aria_ng.html"
# cp_conf_home ".local/share/applications/aria_ng.desktop"
