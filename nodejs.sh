#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install nodejs npm
sudo npm config set registry https://registry.npm.taobao.org --global
npm config set registry https://registry.npm.taobao.org
npm config set disturl https://npm.taobao.org/dist
npm config set electron_mirror https://npm.taobao.org/mirrors/electron/
cp_conf_home ".config/environment.d/nodejs.conf"

sudo npm install -g pnpm
sudo npm install -g yarn
yarn config set registry https://registry.npm.taobao.org
yarn config set disturl https://npm.taobao.org/dist
yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/

sudo npm install -g @microsoft/inshellisense
inshellisense bind
