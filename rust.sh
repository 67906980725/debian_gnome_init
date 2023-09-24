#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

# 国内源
cp_conf_home ".cargo/config"
#  添加到环境变量
# export RUSTUP_DIST_SERVER="https://rsproxy.cn"
# export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
cp_conf_home ".config/environment.d/rust.conf"

#install rust-all
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
bash <(curl -s https://cdn.jsdelivr.net/gh/rust-lang-nursery/rustup.rs/rustup-init.sh)
#rustup default stable # 需要重载 shell
# rustup toolchain install <toolchain_name>
