#!/usr/bin/env bash

# 卸载除简体中文外的其它多语言包
apt list --installed | grep "libreoffice-l10n-" | grep -v "zh-cn" | cut -d "/" -f 1 | xargs sudo apt remove -y
