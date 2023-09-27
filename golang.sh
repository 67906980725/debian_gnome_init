#!/usr/bin/env bash

source ./install.sh
# source ./cp_conf.sh
# source ./default_path.sh

install bison ed gawk gcc libc6-dev make golang-go
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
