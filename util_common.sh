#!/usr/bin/env bash
source ./conf/home/.local/shell/env/path

# 简化的包安装命令
install() {
  sudo apt-get install -y "$@" 
}

# github proxy
# source ./conf/home/.config/environment.d/cmd.conf
GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.net/}"

# 获取 windows 用户目录路径
get_windows_home() {
  find /mnt/c/Users -mindepth 1 -maxdepth 1 -type d -not -path "/mnt/c/Users/Default" -not -path "/mnt/c/Users/Public"
}

# 快捷布署并备份配置文件的相关方法
check_parent() {
  local file="$1"
  # local file_full_path=$(readlink -f "$file")
  local dir=$(dirname "$file")
  [ ! -e "$dir" ] && mkdir -p "$dir"
}
safe_cp() {
  local from="$1"
  local to="$2"
  check_parent "$to"
  cp -rf "$from" "$to"
}
bak_conf_root() {
  local file="$1"
  local bak_file="./conf_bak$file"

  if [ ! -e "$bak_file" ] && [ -e "$file" ]; then
    echo "backup root file ${file} to ${bak_file}"
    safe_cp "$file" "$bak_file"
  fi
}
bak_conf_home() {
  local file="$1"
  local bak_file="./conf_bak/home/$file"
  local home_file="$HOME/$file"

  if [ ! -e "$bak_file" ] && [ -e "$home_file" ]; then
    echo "backup home file ${home_file} to ${bak_file}"
    safe_cp "$home_file" "$bak_file"
  fi
}
cp_conf_root() {
  local file="$1"
  local conf_file="./conf$file"
  bak_conf_root "$file"
  echo "overwrite system file ${file} by ${conf_file}"
  # cat "${conf_file}" 2>&1 | sudo tee $file 
  sudo sh ./util_overwrite.sh "$file" "${conf_file}"
}
cp_conf_home() {
  local file="$1"
  local conf_file="./conf/home/$file"
  local home_file="$HOME/$file"
  bak_conf_home "$file"
  echo "overwrite home file ${home_file} from ${conf_file}"
  if [ -d "$conf_file" ]; then
    rm -rf "$home_file"
  fi
  safe_cp "$conf_file" "$home_file"
}
# 配置文件追加内容
append_conf_root() {
  if [ ! -e "./conf_bak/$1" ]; then
    echo "$2" | sudo tee -a "$1"
  fi
}
append_conf_home() {
  if [ ! -e "./conf_bak/home/$1" ]; then
    echo "$2" >> "$HOME/$1"
  fi
}
