# if [ -e .bashrc ]; then 
#   source .bashrc
# fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# User configuration

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# zsh
ZSH_CACHE_DIR=${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh
[ ! -d $ZSH_CACHE_DIR ] && mkdir $ZSH_CACHE_DIR


# oh-my-zsh
# 使用包管理器安装时
# ZSH=/usr/share/oh-my-zsh
# ZSH_CUSTOM=/usr/share/zsh/
# source /usr/share/oh-my-zsh/oh-my-zsh.sh
# plugins=( z git )
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# 安装在用户目录下时
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"
plugins=( z git zsh-completions zsh-autosuggestions zsh-syntax-highlighting fzf-tab )
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# powerlevel10k 配置
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---------- 自定义 ----------


# 环境变量
export BIN_PATH=${HOME}/.local/bin
export APP_IMAGE_PATH=${HOME}/.local/appimage
export _LD_LIBRARY_PATH=${HOME}/.local/lib

export PATH=$SCRIPT_PATH:$BIN_PATH:$APP_IMAGE_PATH:$_LD_LIBRARY_PATH:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=${_LD_LIBRARY_PATH}:$LD_LIBRARY_PATH

export PATH=$HOME/go/bin:$PATH


# 别名
alias sync="sudo apt update"
alias install="sudo apt install"
alias update="sudo apt full-upgrade"
alias search="apt search"
alias search-local="dpkg --list | grep"
alias pkg-info="apt show"
# alias install_local="sudo dpkg -i"
alias install_local="sudo gdebi"
alias installl="sudo gdebi"
# alias clr-cache="sudo pacman -Scc"
# alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo apt remove"
alias autoremove="sudo apt autoremove"

alias .="cd ./"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"
alias ........="cd ../../../../../../../"
alias .........="cd ../../../../../../../../"
alias ..........="cd ../../../../../../../../../"
alias ...........="cd ../../../../../../../../../../"

# cdls() { cd "$1" && echo $(pwd) && exa --color=auto --icons -a }
# alias cd="cdls"
# zls() { z "$1"; cdls }
# alias z="zls"

alias ls="exa --color=auto --icons"
alias la="ls -a"
alias l="ls -l"
alias lla="ls -al"
alias lt="ls --tree"

alias rm="trash"
alias grep="grep --color=auto"
alias v="nvim"
alias note="cd ~/asset/note && lvim ."

# git
git_aliased=0
git_alias() {
	alias clone="git clone"
	alias remote="git remote"
	alias checkout="git checkout"
	alias status="git status"
	alias pull="git pull"
	alias diff="git diff"
	alias add="git add"
	alias commit="git commit"
	alias branch="git branch"
	alias push="git push"
	alias merge="git merge"
	alias rebase="git rebase"
	alias stash="git stash"
	alias reset="git reset"

	alias ce="git clone"
	alias ct="git checkout"
	alias s="git status"
	alias p="git push"
	alias l="git pull"
	alias d="git diff"
	alias a="git add"
	alias c="git commit"
	alias b="git branch"
	alias m="git merge"
	alias r="git reset"
	alias qp="git add . && git commit -am 'update' && git push -u github main"

	git_aliased=1
}
git_unalias() {
	# 移除长别名
	unalias clone
	unalias remote
	unalias checkout
	unalias status
	unalias pull
	unalias diff
	unalias add
	unalias commit
	unalias branch
	unalias push
	unalias merge
	unalias rebase
	unalias stash
	unalias reset

	# 移除短别名
	unalias ce
	unalias ct
	unalias s
	unalias p
	unalias l
	unalias d
	unalias a
	unalias c
	unalias b
	unalias m
	unalias r
	unalias qp

	git_aliased=0
}
git_hook_chpwd() {
  # 路径 hook, 变更目录后如果是 git 目录, 定义别名, 否则移除别名
	if [ $git_aliased -eq 0 ] && git rev-parse --is-inside-work-tree >/dev/null 2>&1 ; then
		git_alias
	elif [ $git_aliased -eq 1 ]; then
		git_unalias
	fi
}
git_hook_chpwd
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd() { git_hook_chpwd }


# 方法

# 网络流量统计
network_statistics() {
	local s=$(vnstat -d 2 | grep -v estimated | grep -v day | grep -v daily | grep -v + | sed '/^$/d' | awk -F "|" '{print $3}' | tr "\n" ' ')
	echo "network statistics 网络流量(昨日 / 今日): $s"
}
network_statistics

# 系统代理
proxy_use_system_ignores() {
	local ignore_hosts=$(gsettings get org.gnome.system.proxy ignore-hosts)
	if [ "$ignore_hosts" != "@as []" ]; then
		# ['localhost', '127.0.0.0/8', '::1']
		ignore_hosts=$(echo "$ignore_hosts" | sed "s/^\[//;s/\]$//;s/'//g" | tr -d ' ')
		# localhost,127.0.0.1,localaddress,.example.com
		export no_proxy="$ignore_hosts"
	fi
}
proxy_use_system() {
  local http_proxy_port=$(gsettings get org.gnome.system.proxy.http port)
	if [ $http_proxy_port -gt 0 ]; then
		local http_proxy_host=$(gsettings get org.gnome.system.proxy.http host | sed "s/'//g")
		export http_proxy="$http_proxy_host:$http_proxy_port"
		# git config --global http.https://github.com.proxy ${http_proxy}
	fi

	local https_proxy_port=$(gsettings get org.gnome.system.proxy.https port)
	if [ $https_proxy_port -gt 0 ]; then
		local https_proxy_host=$(gsettings get org.gnome.system.proxy.https host | sed "s/'//g")
		export https_proxy="$https_proxy_host:$https_proxy_port"
    # git config --global https.https://github.com.proxy ${https_proxy}
	fi

	local socks_proxy_host=$(gsettings get org.gnome.system.proxy.socks host | sed "s/'//g")
	local socks_proxy_port=$(gsettings get org.gnome.system.proxy.socks port)
	if [ $socks_proxy_port -gt 0 ]; then
		export socks_proxy="$socks_proxy_host:$socks_proxy_port"
	fi

	local ftp_proxy_port=$(gsettings get org.gnome.system.proxy.ftp port)
	if [ $ftp_proxy_port -gt 0 ]; then
		local ftp_proxy_host=$(gsettings get org.gnome.system.proxy.ftp host | sed "s/'//g")
		export ftp_proxy="$ftp_proxy_host:$ftp_proxy_port"
	fi
	proxy_use_system_ignores
	echo "using proxy 代理已启用"
}
proxy_use_system_all() {
	# https://zhuanlan.zhihu.com/p/46973701
	local auto_proxy_url=$(gsettings get org.gnome.system.proxy autoconfig-url)
	export ALL_PROXY="$auto_proxy_url"
	export all_proxy="$auto_proxy_url"
	proxy_use_system_ignores
}
proxy_clean() {
  unset http_proxy
	unset https_proxy
	unset socks_proxy
	unset ftp_proxy
	# git config --global --unset http.https://github.com.proxy
  # git config --global --unset https.https://github.com.proxy

	unset ALL_PROXY
	unset all_proxy
}
proxy_auto_use() {
	# 检测系统代理, 有代理则启用命令行代理
  local proxy_mode=$(gsettings get org.gnome.system.proxy mode)
	if [ "$proxy_mode" = "'manual'" ]; then
  	proxy_use_system
	elif [ "$proxy_mode" = "'auto'" ]; then
		proxy_use_system_all
	else
		proxy_clean
	fi
}
proxy_auto_use
