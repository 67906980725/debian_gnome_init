#!/usr/bin/env bash
# nodejs
# https://github.com/nodesource/distributions
source ./util_common.sh

# nodejs 20 (如果之前已经安装过低版本需要 remove 后 autoremove)
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# install npm # 20 自带
sudo npm config set registry https://registry.npmmirror.com --global
npm config set registry https://registry.npmmirror.com
# 20 没有以下设置项
# npm config set disturl https://registry.npmmirror.com/dist
# npm config set electron_mirror https://registry.npmmirror.com/mirrors/electron/
# cp_conf_home ".config/environment.d/nodejs.conf"

# yarn
sudo npm install -g yarn
sudo yarn config set registry https://registry.npmmirror.com --global
yarn config set registry https://registry.npmmirror.com
# yarn config set disturl https://registry.npmmirror.com/dist
# yarn config set electron_mirror https://registry.npmmirror.com/mirrors/electron/

# pnpm
sudo npm install -g pnpm
sudo pnpm config set registry https://registry.npmmirror.com --global
pnpm config set registry https://registry.npmmirror.com
# pnpm config set disturl https://registry.npmmirror.com/dist
# pnpm config set electron_mirror https://registry.npmmirror.com/mirrors/electron/

# 命令行补全工具
# sudo npm install -g @microsoft/inshellisense
# sudo npm install -g node-gyp
# sudo npm install -g node-pty
# inshellisense bind # 报错
