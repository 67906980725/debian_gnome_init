#!/usr/bin/env bash
# rust
# https://rsproxy.cn/
source ./util_common.sh

# 国内源
cp_conf_home ".cargo/config"
#  添加到环境变量
# export RUSTUP_DIST_SERVER="https://rsproxy.cn"
# export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
# cp_conf_home ".config/environment.d/rust.conf"
cp_conf_home ".local/shell/rc/rust"

# install rust-all
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh
source "$HOME/.cargo/env"
rustup default stable
# rustup toolchain install <toolchain_name>
