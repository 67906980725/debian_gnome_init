#!/usr/bin/env bash
nerd_ver="3.0.2"

source ./install.sh

install fonts-wqy-microhei

# https://github.com/ryanoasis/nerd-fonts
install_nerd() {
  local font_name="$1"
  local font_pkg="${font_name}.tar.xz"
  wget "${GITHUB_PROXY}https://github.com/ryanoasis/nerd-fonts/releases/download/v$nerd_ver/$font_pkg"
  local target_dir="$HOME/.local/share/fonts/$font_name"
  if [ ! -e "$target_dir" ]; then
    mkdir -p "$target_dir"
    tar -Jxvf "$font_pkg" -C "$target_dir"
  fi
  rm -f "$font_pkg"
}

install_nerd JetBrainsMono
install_nerd SourceCodePro
install_nerd UbuntuMono

fc-cache -fv
