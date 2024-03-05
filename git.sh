#!/usr/bin/env bash
# git 默认配置
# https://guide.deepin.org/deepin%E8%BF%9B%E9%98%B6%E6%95%99%E7%A8%8B/10.%E6%95%B0%E6%8D%AE%E7%AE%A1%E7%90%86/10.4.Git.html
source ./util_common.sh

git config --global user.name "$(whoami)"
git config --global user.email "$(whoami)" # 修改为邮箱

git config --global init.defaultBranch main
git config --global push.default current 
# git config --global pull.rebase false

# 解决 ssh: connect to host github.com port 22: Connection timed out
# https://zhuanlan.zhihu.com/p/521340971
cp_conf_home ".ssh/config"
cp_conf_home ".local/shell/rc/git"
