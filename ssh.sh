#!/usr/bin/env bash
# 恢复备份的 ssh 密钥

# cp -frp ./.ssh $HOME/

chmod 700 ~/.ssh  #(drwx------)
chmod 644  ~/.ssh/id_rsa.pub  #(-rw-r--r--)
chmod 600 ~/.ssh/id_rsa   #(-rw-------)

ssh-agent bash # wsl 需要
ssh-add ~/.ssh/id_rsa