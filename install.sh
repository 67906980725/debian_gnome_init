#!/usr/bin/env bash

install()
{
    sudo apt install "$@"
}

# github proxy
source ./conf/home/.config/environment.d/cmd.conf