#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

install mpv

# mpv实现简单音乐/视频音乐随机播放 (需要修改音乐目录)
cp_conf_home ".local/bin/mp"
