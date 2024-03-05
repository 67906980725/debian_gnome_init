#!/usr/bin/env bash
# 字体
source ./util_common.sh

# 文泉驿
# install fonts-wqy-microhei ttf-wqy-zenhei
# 状态栏符号
# install fonts-powerline

# nerd font 解决其它软件无法显示特殊符号 (如vscode)
nerd_ver="3.1.1"
install_nerd() {
  # https://github.com/ryanoasis/nerd-fonts
  local font_name="$1"
  local font_pkg="${font_name}.tar.xz"
  wget "${GITHUB_PROXY}https://github.com/ryanoasis/nerd-fonts/releases/download/v$nerd_ver/$font_pkg"
  local target_dir="$HOME/.local/share/fonts/$font_name"
  mkdir -p "$target_dir"
  tar -Jxvf "$font_pkg" -C "$target_dir"
  rm -f "$font_pkg"
}

install_nerd JetBrainsMono
install_nerd SourceCodePro
# install_nerd UbuntuMono

fc-cache -fv
