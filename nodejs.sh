#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install nodejs npm
npm config set registry https://registry.npm.taobao.org
sudo npm config set registry https://registry.npm.taobao.org --global
cp_conf_home ".config/environment.d/nodejs.conf"

sudo npm install -g pnpm
sudo npm install -g yarn
