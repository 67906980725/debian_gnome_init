#!/usr/bin/env bash
# lunarvim
# https://github.com/LunarVim/LunarVim
source ./util_common.sh

# 依赖
# sh ./github_proxy.sh
install fd-find ripgrep
install libfuse2 # appimage
sh ./python.sh
install python3-pynvim
sh ./nodejs.sh

# 下载 neovim.appimage
mkdir -p $HOME/.local/appimage
wget -O $HOME/.local/appimage/nvim ${GITHUB_PROXY}https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x $HOME/.local/appimage/nvim

# 使用安装脚本安装(stable)
# https://www.lunarvim.org/docs/installation
# 脚本提示安装依赖时只有第一个 nodejs 的依赖输 y 安装
# 后两个输 n (python 的 pip pynvim 和 系统命令 fd ripgrep 已经用包管理器安装过了)  
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s ${GITHUB_PROXY}/https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
# when Error: read ETIMEDOUT, check ~/.gitconfig github proxy if wrong

# 内部命令
# :Lazy sync # 安装插件
# :LvimSyncCorePlugins # 更新插件
# :LvimUpdate # 更新 lvim

# 命令行命令
# lvim +LvimUpdate +q # 更新 lvim

# 默认个人配置
# cp ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua ~/.config/lvim/config.lua
cp_conf_home ".config/lvim/config.lua"

# 安装完有报错时启动lvim, 如果没有自动安装插件输入 :Lazy sync 安装插件
# cp ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua ~/.config/lvim/config.lua

# termux	
# pkg install -y openssh git curl wget vim bat croc neovim build-essential python vim-python nodejs rust fd ripgrep
# 同样换源, 加 git 代理
# 下载安装脚本 修改 detect_platform 方法 else 为 pkg install -y 后运行
