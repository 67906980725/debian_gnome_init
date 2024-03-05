#!/usr/bin/env bash
source ./util_common.sh

cp_conf_root "/etc/apt/sources.list"

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
