#!/usr/bin/env bash

source ./install.sh
source ./cp_conf.sh
source ./default_path.sh

nemo() {
    install nemo nemo-fileroller
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search # 默认管理器
    gsettings set org.nemo.desktop show-desktop-icons true                         # 显示 desktop 文件图标
    gsettings set org.cinnamon.desktop.default-applications.terminal exec kgx      # 默认终端
}

plugin() {
    install chrome-gnome-shell 
    gnome-extensions enable "$(gnome-extensions list | grep -m 1 user-theme)"

    # xdg-open https://extensions.gnome.org/extension/615/appindicator-support/
    install gnome-shell-extension-appindicator
    gnome-extensions enable "$(gnome-extensions list | grep -m 1 appindicator)"

    firefox https://addons.mozilla.org/zh-CN/firefox/addon/gnome-shell-integration/
    

    firefox https://extensions.gnome.org/extension/779/clipboard-indicator/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 clipboard)"

    firefox https://extensions.gnome.org/extension/1514/rounded-corners/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 rounded-corners)

    firefox https://extensions.gnome.org/extension/5237/rounded-window-corners/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 rounded-window-corners)"

    firefox https://extensions.gnome.org/extension/1085/simple-net-speed/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 netspeed)"

    # gsettings set org.gnome.shell enabled-extensions "['clipboard-indicator@tudmotu.com', 'netspeed@alynx.one', 'appindicatorsupport@rgcjonas.gmail.com']"
}

theme() {
    install vimix-cursors tela-circle-icon-theme-git gnome-themes-extra
    gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle'     # icon
    gsettings set org.gnome.desktop.interface cursor-theme 'Vimix-cursors' # cursor
    gsettings set org.gnome.desktop.interface cursor-size 32               # cursor size
    cp_conf_home ".local/bin/toggelt_dark_mode"                            # change dark mode cmd eg: toggelt_dark_mode light / toggelt_dark_mode dark
    install_ur orchis-theme                                                # 选不带 git 的, 默认 github 拉不动, 需要手动执行后去加速站下包
    #gsettings set org.gnome.shell.extensions.user-theme name 'Orchis'
    #  qt
    install adwaita-qt5 adwaita-qt6 qgnomeplatform-qt5 qgnomeplatform-qt6
    #  QT_QPA_PLATFORMTHEME=qgnomeplatform
    cp_conf_home ".config/environment.d/gnome.conf"
}

touchpad() {
    gsettings set org.gnome.desktop.peripherals.touchpad speed "0.66972477064220182" # 速度
    gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true           # 轻触以点击
}

eye() {
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true             # 开启护
    gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 3500         # 色温
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false # 关闭定时开关
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-from 20.0       # 永不关闭
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-to 20.0
}

keybind() {
    # alt+tab 切换窗口
    gsettings set org.gnome.desktop.wm.keybindings switch-windows '["<Alt>Tab"]'
    # 窗口/应用切换不跨工作区  (win+滚轮可以切换工作区)
    gsettings set org.gnome.shell.app-switcher current-workspace-only true
    #  快捷键注册表
    gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
        "[ \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/' \
    ]"
    # win+c 计算器
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Super>c"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-calculator"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Calculator"
    # win+e 文件管理
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>e"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "nemo"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "nemo"
    # ctrl+alt+t console
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Ctrl><Alt>t"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "kgx"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "console"
    # alt+shift+a 截图
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "<Shift><Alt>a"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "flameshot gui"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "flameshot"
    # 亮度
    install brightnessctl
    #  ctrl+alt+shift+= 升高亮度
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding "<Ctrl><Alt><Shift>equal"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command "brightnessctl set 2.5%+"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name "brightness plus"
    #  ctrl+alt+shift+- 降低亮度
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding "<Ctrl><Alt><Shift>minus"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command "brightnessctl set 2.5%-"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name "brightness minus"
    # ctrl+alt+shift+m 禁用/启用 麦克风
    cp_conf_home ".local/bin/microphone_mute"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding "<Ctrl><Alt><Shift>m"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command "$BIN_PATH/microphone_mute"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name "microphon mute toggelt"
    # ctrl+alt+shift+0 增大音量
    cp_conf_home ".local/bin/volume_change"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding "<Ctrl><Alt><Shift>0"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command "$BIN_PATH/volume_change plus"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name "volume plus"
    # ctrl+alt+shift+9 减小音量
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding "<Ctrl><Alt><Shift>9"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command "$BIN_PATH/volume_change substract"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name "volume substract"
    # ctrl+alt+shift+d dark/light toggelt
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding "<Ctrl><Alt><Shift>d"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command "$BIN_PATH/toggelt_dark_mode"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name "toggelt dark mode"
    # ctrl+shift+esc monitor
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ binding "<Ctrl><Shift>Escape"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ command "gnome-system-monitor"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ name "monitor"
}

all() {
    nemo
    plugin
    # theme
    touchpad
    eye
    keybind
}

case $1 in
nemo) nemo ;;
plugin) plugin ;;
theme) theme ;;
touchpad) touchpad ;;
eye) eye ;;
keybind) keybind ;;
*) all ;;
esac
