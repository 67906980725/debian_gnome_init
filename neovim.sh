#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

# 先安装 nodejs pip cargo, 并换好各自的国内源, 然后 git 配置 https 和 raw 的国内代理

install python3-all python3-pynvim fd-find ripgrep
# node 的插件让脚本装 其它的自己用包管理器装
# npm i -S tree-sitter-cli neovim --registry https://registry.npm.taobao.org/
# 如果有网络问题 (clash 需要开启 tun 模式) 可以手动添加 proxy 后运行安装脚本
# nvim $HOME/.local/share/yarn/global/node_modules/tree-sitter-cli
# node install.js

xdg-open https://github.com/LunarVim/LunarVim
xdg-open https://www.lunarvim.org/docs/installation

cp ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua ~/.config/lvim/config.lua
