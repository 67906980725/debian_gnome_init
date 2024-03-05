#!/usr/bin/env bash

source ./util_common.sh

# 默认配置
#  ! 配置中默认了 shell 为 zsh, console 为 gnome 的 kgx, 根据实际情况修改
cp_conf_home ".config/Code/User/settings.json"
#  使用 mg 组合 z 和 code 两个命令, 方便的使用 vscode 打开常用目录
# cp_conf_home ".local/bin/mg"

extension() {
  /usr/bin/code --install-extension "$1"
}


extentions() {
  # idea key mapping
  # extension k--kato.intellij-idea-keybindings

  # chinese
  extension ms-ceintl.vscode-language-pack-zh-hans
  
  # markdown
  extension yzane.markdown-pdf
  extension davidanson.vscode-markdownlint
  extension shd101wyy.markdown-preview-enhanced

  # share code
  extension adpyke.codesnap

  # gpt
  extension alibaba-cloud.tongyi-lingma

  # shell
  extension foxundermoon.shell-format
  extension timonwong.shellcheck
  extension jeff-hykin.better-shellscript-syntax
  extension truman.autocomplate-shell
  extension tetradresearch.vscode-h2o

  # python 
  extension ms-python.python
  extension ms-python.vscode-pylance

  # remote
  extension ms-vscode-remote.remote-ssh
  extension ms-vscode-remote.remote-ssh-edit
  extension ms-vscode.remote-explorer

  # github actions
  extension github.vscode-github-actions

  # rust
  extension rust-lang.rust-analyzer
  extension dustypomerleau.rust-syntax
  extension zhangyue.rust-mod-generator

  # vue3
  # extension vue.vscode-typescript-vue-plugin
  # extension vue.volar

  # build
  # extension skellock.just
}
extentions
