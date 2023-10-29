#!/usr/bin/env bash

# 对 github 的 https 和 raw 请求使用 ghproxy 代理
git config --global url."https://ghproxy.com/https://github.com/".insteadOf "https://github.com/"
git config --global url."https://ghproxy.com/https://raw.githubusercontent.com/".insteadOf "https://raw.githubusercontent.com/"

# 使用命令行的代理
git config --global --get-all http.proxy 