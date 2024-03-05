#!/usr/bin/env bash
source ./util_common.sh

nemo() {
    install nemo nemo-fileroller
    xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search # 默认管理器
    gsettings set org.nemo.desktop show-desktop-icons true                         # 显示 desktop 文件图标
    gsettings set org.cinnamon.desktop.default-applications.terminal exec kgx      # 默认终端
}

plugin() {
    # 允许状态栏主题
    gnome-extensions enable "$(gnome-extensions list | grep -m 1 user-theme)"
    
    # 浏览器管理扩展
    #  chrome
    install chrome-gnome-shell
    #  firefox
    firefox https://addons.mozilla.org/zh-CN/firefox/addon/gnome-shell-integration/ &

    # 托盘 重启/注销后在"扩展"中启用
    # xdg-open https://extensions.gnome.org/extension/615/appindicator-support/
    install gnome-shell-extension-appindicator
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 appindicator)"

    # 删除“窗口已就绪”通知，改为使窗口成为焦点
    xdg-open https://extensions.gnome.org/extension/5410/grand-theft-focus/
    
    # 剪切板
    # xdg-open https://extensions.gnome.org/extension/779/clipboard-indicator/
    xdg-open https://extensions.gnome.org/extension/5721/clipboard-indicator/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 clipboard)"

    # 网速
    xdg-open https://extensions.gnome.org/extension/1085/simple-net-speed/
    # 保持在托盘区最左侧显示 登录后重新加载以实现网速插件最后加载的效果
    cp_conf_home ".config/autostart/reload_net_speed_monitor.desktop"
    # 修改默认模式为第 4 个并禁用点击轮换
    # sed -i '6 s@0@3@' "$HOME/.local/share/gnome-shell/extensions/simplenetspeed@biji.extension/schemas/org.gnome.shell.extensions.simplenetspeed.gschema.xml"
    # sed -i 's/ button\.connect/ \/\/button\.connect/' "$HOME/.local/share/gnome-shell/extensions/simplenetspeed@biji.extension/extension.js"

    # dash to dock
    xdg-open https://extensions.gnome.org/extension/307/dash-to-dock/

    # 使用 Ctrl+Super+Up/Down 对工作区重新排序
    xdg-open https://extensions.gnome.org/extension/3685/reorder-workspaces/

    # 模糊外观
    xdg-open https://extensions.gnome.org/extension/3193/blur-my-shell/

    # 使窗口在移动或调整大小时半透明
    xdg-open https://extensions.gnome.org/extension/1446/transparent-window-moving/

    # 屏幕圆角
    xdg-open https://extensions.gnome.org/extension/1514/rounded-corners/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 rounded-corners)

    # xdg-open https://extensions.gnome.org/extension/5237/rounded-window-corners/
    # gnome-extensions enable "$(gnome-extensions list | grep -m 1 rounded-window-corners)"

    # 自动最大化新窗口，在其周围留下“无用的间隙”
    xdg-open https://extensions.gnome.org/extension/5696/one-window-wonderland/

    # 窗口最大化时无标题栏
    # xdg-open https://extensions.gnome.org/extension/4630/no-titlebar-when-maximized/

    # 在 GNOME 的应用程序菜单中隐藏应用程序
    xdg-open https://extensions.gnome.org/extension/5895/app-hider/

    # 工作区切换环绕
    xdg-open https://extensions.gnome.org/extension/1116/workspace-switch-wraparound/

    # 自定义主题色
    xdg-open https://extensions.gnome.org/extension/5547/custom-accent-colors/

    # 透明状态栏 (blur-my-shell 包含相同功能
    # xdg-open https://extensions.gnome.org/extension/1765/transparent-topbar/

    # 为你的无线网络生成分享二维码
    xdg-open https://extensions.gnome.org/extension/5416/wifi-qrcode/

    # 农历
    # install gir1.2-lunardate-3.0 lunar-date liblunar-date-dev liblunar-date-3.0-1
    # xdg-open https://extensions.gnome.org/extension/675/lunar-calendar/

    # gsettings set org.gnome.shell enabled-extensions "['clipboard-indicator@tudmotu.com', 'netspeed@alynx.one', 'appindicatorsupport@rgcjonas.gmail.com']"
}

theme() {
    install papirus-icon-theme oxygen-icon-theme
    install bibata-cursor-theme
    # xdg-open https://github.com/vinceliuice/Orchis-theme

    gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
    gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
    # gsettings set org.gnome.desktop.interface cursor-size 24
    #gsettings set org.gnome.shell.extensions.user-theme name 'Orchis'

    cp_conf_home ".local/script/toggelt_dark_mode"
    
    # qt
    install adwaita-qt6 
    # install qgnomeplatform-qt6
    # QT_QPA_PLATFORMTHEME=qgnomeplatform
    # cp_conf_home ".config/environment.d/gnome.conf"
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

# 快捷键 重启后生效
keybind() {
    # 修改切换窗口为 alt+tab
    gsettings set org.gnome.desktop.wm.keybindings switch-applications '[]'
    gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward '[]'
    gsettings set org.gnome.desktop.wm.keybindings switch-windows '["<Alt>Tab"]'
    gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward '["<Shift><Alt>Tab"]'

    # 修改切换窗口/应用不跨工作区 (win+滚轮可以切换工作区)
    gsettings set org.gnome.shell.app-switcher current-workspace-only true

    ## 自定义快捷键
    # 快捷键注册表 注册下边定义的快捷键id
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
    #local file_manager="nemo"
    local file_manager="nautilus -w"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>e"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "$file_manager"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "file-manager"
    
    # ctrl+alt+t console
    # local console="kgx"
    local console="gnome-terminal"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Ctrl><Alt>t"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "$console"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "console"
    
    # alt+shift+a 截图
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding "<Shift><Alt>a"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command "flameshot gui"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name "flameshot"
    
    # 亮度
    install brightnessctl
    #  ctrl+alt+shift+= 亮度+
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding "<Ctrl><Alt><Shift>equal"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command "brightnessctl set 2.5%+"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name "brightness plus"
    #  ctrl+alt+shift+- 亮度-
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding "<Ctrl><Alt><Shift>minus"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command "brightnessctl set 2.5%-"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name "brightness minus"
    
    # ctrl+alt+shift+m 禁用/启用 麦克风
    cp_conf_home ".local/script/microphone_mute"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding "<Ctrl><Alt><Shift>m"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command "$BIN_PATH/microphone_mute"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name "microphon mute toggelt"
    
    # 音量
    # ctrl+alt+shift+0 音量+
    cp_conf_home ".local/script/volume_change"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding "<Ctrl><Alt><Shift>0"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command "$BIN_PATH/volume_change plus"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name "volume plus"
    # ctrl+alt+shift+9 音量-
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding "<Ctrl><Alt><Shift>9"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command "$BIN_PATH/volume_change substract"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name "volume substract"
    
    # ctrl+alt+shift+d dark/light 深色模式切换
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding "<Ctrl><Alt><Shift>d"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command "$BIN_PATH/toggelt_dark_mode"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name "toggelt dark mode"
    
    # ctrl+shift+esc monitor (任务管理器)
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ binding "<Ctrl><Shift>Escape"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ command "gnome-system-monitor"
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom100/ name "monitor"
}

all() {
    # nemo
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
