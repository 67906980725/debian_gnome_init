#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

modprobe kvm
modprobe kvm_amd
sudo usermod -aG kvm $USER

install docker.io

sudo usermod -aG docker $USER


sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
    "registry-mirrors": [
        "https://docker.m.daocloud.io",
        "https://dockerproxy.com",
        "https://docker.mirrors.ustc.edu.cn",
        "https://docker.nju.edu.cn"
    ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

