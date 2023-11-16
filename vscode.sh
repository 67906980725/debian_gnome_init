#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# 默认配置
#  ! 配置中默认了 shell 为 zsh, console 为 gnome 的 kgx, 根据实际情况修改
cp_conf_home ".config/Code/User/settings.json"
#  使用 mg 组合 z 和 code 两个命令, 方便的使用 vscode 打开常用目录
cp_conf_home ".local/bin/mg"

extention() {
  # idea key mapping
  code --install-extension k--kato.intellij-idea-keybindings
  # chinese
  code --install-extension ms-ceintl.vscode-language-pack-zh-hans
  # markdown
  code --install-extension yzane.markdown-pdf
  code --install-extension davidanson.vscode-markdownlint
  # share code
  code --install-extension adpyke.codesnap

  # gpt
  code --install-extension alibaba-cloud.tongyi-lingma

  # github actions
  code --install-extension github.vscode-github-actions

  # rust
  code --install-extension rust-lang.rust-analyzer
  code --install-extension dustypomerleau.rust-syntax
  code --install-extension zhangyue.rust-mod-generator

  # python 
  code --install-extension ms-python.python
  code --install-extension ms-python.vscode-pylance

  # vue3
  code --install-extension vue.vscode-typescript-vue-plugin
  code --install-extension vue.volar

  # build
  code --install-extension skellock.just

  # remote
  code --install-extension ms-vscode-remote.remote-ssh
  code --install-extension ms-vscode-remote.remote-ssh-edit
  code --install-extension ms-vscode.remote-explorer
}
extention
