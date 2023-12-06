#!/usr/bin/env bash

source ./install.sh

# 对 github 的 https 和 raw 请求使用 ghproxy 代理
git config --global url."${GITHUB_PROXY}https://github.com/".insteadOf "https://github.com/"
git config --global url."${GITHUB_PROXY}https://raw.githubusercontent.com/".insteadOf "https://raw.githubusercontent.com/"
# 取消代理
# git config --global --unset url."${GITHUB_PROXY}https://github.com/"
# git config --global --unset url."${GITHUB_PROXY}https://raw.githubusercontent.com/"

# 使用命令行的代理
git config --global --get-all http.proxy 