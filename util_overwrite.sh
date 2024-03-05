#!/usr/bin/env bash
# 用参数2文件内容覆盖参数1文件
# 依赖于 common.sh

# sudo overwrite.sh target.txt source.txt
cat "$2" > "$1"