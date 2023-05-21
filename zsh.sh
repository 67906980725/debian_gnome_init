#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install zsh fzf bat fd-find fonts-powerline unzip vnstat
sudo systemctl enable --now vnstat

# git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# sudo cp -frp $HOME/.oh-my-zsh/custom/plugins/* /usr/share/oh-my-zsh/custom/plugins/
# sudo cp -frp $HOME/.oh-my-zsh/custom/themes/* /usr/share/oh-my-zsh/custom/themes/

px="https://ghdl.feizhuqwq.cf"
wget -O oh_my_zsh.zip "$px/https://github.com/ohmyzsh/ohmyzsh/archive/refs/heads/master.zip"
unzip oh_my_zsh.zip
mv ohmyzsh-master $HOME/.oh-my-zsh
rm oh_my_zsh.zip

wget -O autosuggestions.zip "$px/https://github.com/zsh-users/zsh-autosuggestions/archive/refs/heads/master.zip"
unzip autosuggestions.zip
mv zsh-autosuggestions-master $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
rm autosuggestions.zip

wget -O completions.zip "$px/https://github.com/zsh-users/zsh-completions/archive/refs/heads/master.zip"
unzip completions.zip
mv zsh-completions-master $HOME/.oh-my-zsh/custom/plugins/zsh-completions
rm completions.zip

wget -O highlighting.zip "$px/https://github.com/zsh-users/zsh-syntax-highlighting/archive/refs/heads/master.zip"
unzip highlighting.zip
mv zsh-syntax-highlighting-master $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

wget -O fzf_tab.zip "$px/https://github.com/Aloxaf/fzf-tab/archive/refs/heads/master.zip"
unzip fzf_tab.zip
mv fzf-tab-master $HOME/.oh-my-zsh/custom/plugins/fzf-tab
rm fzf_tab.zip

wget -O powerlevel10k.zip "$px/https://github.com/romkatv/powerlevel10k/archive/refs/heads/master.zip"
unzip powerlevel10k.zip
mv powerlevel10k-master $HOME/.oh-my-zsh/custom/themes/powerlevel10k
rm powerlevel10k.zip

cp_conf_home ".zshrc"
cp_conf_home ".p10k.zsh"

chsh -s "$(which zsh)"

# 一些常用命令封装
cp_conf_home ".local/bin/now"
cp_conf_home ".local/bin/k"
cp_conf_home ".local/bin/len"

cp_conf_home ".local/bin/down_github"
