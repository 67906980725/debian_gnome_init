#!/usr/bin/env bash

install()
{
    sudo apt install "$@"
}

GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.com/}"
