#!/usr/bin/env bash
# 安装fastgithub, 由于fastgithub已删库故废弃
source ./util_common.sh

# dev-sidecar
wget -P $HOME/Downloads ${GITHUB_PROXY}https://github.com/docmirror/dev-sidecar/releases/download/v1.7.3/DevSidecar-1.7.3.deb

# 版本
ver="2.1.4"
# 安装目录
mkdir -p "$HOME/.local/app"
install_path="$HOME/.local/app/fastgithub"
# 解压生成的文件夹
unzip_name="fastgithub_linux-x64"
# 压缩包名
zip_name="${unzip_name}.zip"

# 下载解压移动到安装目录后删除压缩包
wget "${GITHUB_PROXY}https://github.com/dotnetcore/FastGithub/releases/download/$ver/$zip_name"
unzip "$zip_name"
rm -f "$zip_name"
if [ -e "$install_path" ]; then
  rm -rf "$install_path"
fi
mv -f "$unzip_name" "$install_path"

# 默认配置
cp_conf_home ".local/app/fastgithub/fastgithub_deamon.sh"
cp_conf_home ".local/share/applications/fastgithub.desktop"
ln -sf "$HOME/.local/share/applications/fastgithub.desktop" "$HOME/.config/autostart/"
# rm "$HOME/.config/autostart/fastgithub.desktop"

# firefox 需要安装证书, 请查看安装目录下 README.html
# 设置->隐私与安全->证书->查看证书->证书颁发机构，导入cacert/fastgithub.cer，勾选“信任由此证书颁发机构来标识网站”
# 重新安装 fastgithub 后 firefox 报错: "对等端的证书有一个无效的签名." 时删除旧证书安装新证书就可以了

# 已知问题: 
# 会导致 chrome-gnome-shell 无法安装扩展
# 会导至 npm install 时 "ERR! code ERR_INVALID_URL"
# 以上情况需要临时关闭 fastgithub
