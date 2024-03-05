#!/usr/bin/env bash
# shell: zsh
source ./util_common.sh

install zsh fzf bat fd-find fonts-powerline unzip 
install trash-cli

# 插件
git clone --depth=1 ${GITHUB_PROXY}https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 ${GITHUB_PROXY}https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 ${GITHUB_PROXY}https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# using package manager
# install zsh-autosuggestions zsh-syntax-highlighting

# 配置
cp_conf_home ".zshrc"
cp_conf_home ".p10k.zsh"
cp_conf_home ".local/shell/env/path"
cp_conf_home ".local/shell/rc/base"
cp_conf_home ".local/shell/rc/apt"

chsh -s "$(which zsh)"

# 一些常用命令封装
# 用 vscode 打开 z 命令跳转的路径
cp_conf_home ".local/script/mg"
# 杀死所有包含关键词的进程
cp_conf_home ".local/script/k"
# 统计当前目录大小
cp_conf_home ".local/script/len"
# 方便的 ssh 远程主机选择 (需要远程主机信任当前主机公钥)
cp_conf_home ".local/script/sshc"

# cp_conf_home ".local/bin/down_github"


# install vnstat
# sudo systemctl enable --now vnstat