#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh

cp_conf_root "/etc/apt/sources.list"

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
