#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

cp_conf_home ".config/lvim/config.lua"

# 先安装 nodejs pip cargo, 并换好各自的国内源, 然后 git 配置 https 和 raw 的国内代理
install python3-all python3-pynvim fd-find ripgrep

# 使用安装脚本安装(只需要让脚本安装 nodejs 的依赖, python 的 pip pynvim 和 fd 提前用包管理器安装)
xdg-open https://github.com/LunarVim/LunarVim
xdg-open https://www.lunarvim.org/docs/installation

# 安装完有报错时启动lvim, 如果没有自动安装插件输入 :Lazy sync 安装插件
# cp ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua ~/.config/lvim/config.lua


# termux	
pkg install -y openssh git curl wget vim bat croc neovim build-essential python vim-python nodejs rust fd ripgrep
# 同样换源, 加 git 代理
# 下载安装脚本 修改 detect_platform 方法 else 为 pkg install -y 后运行

