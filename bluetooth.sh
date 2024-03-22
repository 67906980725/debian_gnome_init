#!/usr/bin/env bash
source ./util_common.sh

# 蓝牙突然掉线并打不开时
# 尝试1: https://zhuanlan.zhihu.com/p/559430249
sudo rmmod btusb
sudo modprobe btusb
# 尝试2: https://www.cnblogs.com/mingcc/p/17110079.html
# 修改 /etc/bluetooth/main.conf中的Experimental选项为true
# 尝试3: https://bbs.archlinux.org/viewtopic.php?id=281230
sudo btmgmt le on
# 兜底: 重置bios; livecd中可以开启蓝牙时重启后恢复正常