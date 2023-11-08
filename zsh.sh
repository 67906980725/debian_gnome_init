#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install zsh fzf bat fd-find fonts-powerline unzip trash-cli
# install zsh-autosuggestions zsh-syntax-highlighting

# install vnstat
# sudo systemctl enable --now vnstat

# 从 github clone 插件
GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.net/}"
git clone --depth=1 ${GITHUB_PROXY}https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 ${GITHUB_PROXY}https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 ${GITHUB_PROXY}https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp_conf_home ".zshrc"
cp_conf_home ".p10k.zsh"

chsh -s "$(which zsh)"

# 一些常用命令封装
cp_conf_home ".local/bin/now"
cp_conf_home ".local/bin/k"
cp_conf_home ".local/bin/len"

cp_conf_home ".local/bin/down_github"
