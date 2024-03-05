#!/usr/bin/env bash
source ./util_common.sh

# install python3-all # 不做 python 开发可以使用这个包
install python3-full

install pip pipx
# pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/ # 不可用 [2023-12-13]

pipx ensurepath
