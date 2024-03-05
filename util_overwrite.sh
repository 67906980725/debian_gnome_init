#!/usr/bin/env bash
# 用文件二内容覆盖文件一
# 依赖于util_common.sh

# sudo util_overwrite.sh target.txt source.txt
cat "$2" > "$1"