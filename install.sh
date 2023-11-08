#!/usr/bin/env bash

install()
{
    sudo apt install "$@"
}

# https://ghproxy.net/ https://gh-proxy.com/
# 发生变更时需要同步修改 $HOME/.config/environment.d/cmd.conf
GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.net/}"
