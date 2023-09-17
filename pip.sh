#!/usr/bin/env bash

source ./install.sh
# source ./cp_conf.sh

install pip
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
