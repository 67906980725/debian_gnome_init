#!/usr/bin/env bash
# 全局设置 github proxy
# 当代理地址变更时修改 util_common.sh 后运行此脚本
source ./util_common.sh

set_git() {
  git config --global url."${GITHUB_PROXY}https://github.com/".insteadOf "https://github.com/"
  git config --global url."${GITHUB_PROXY}https://raw.githubusercontent.com/".insteadOf "https://raw.githubusercontent.com/"
  # 使用命令行的代理
  # git config --global --get-all http.proxy 
  # 取消设置
  # git config --global --unset url."${GITHUB_PROXY}https://github.com/"
  # git config --global --unset url."${GITHUB_PROXY}https://raw.githubusercontent.com/"
}
set_git

set_env() {
  mkdir -p $HOME/.local/shell/rc
  echo "export GITHUB_PROXY=\"$GITHUB_PROXY\"" > "$HOME/.local/shell/rc/github_proxy"
}
set_env