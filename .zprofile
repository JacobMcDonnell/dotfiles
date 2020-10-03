# Default programs:
export PATH=$PATH:$HOME/.local/bin
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium" #The Chad Ungoogled-chromium
export READER="zathura"
export FILE="vifm"
export PICTURE="sxiv"

# Setting up XDG Dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Moving Folder and Files from ~/
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export RANDFILE="$XDG_DATA_HOME"/rnd/rnd
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE=-
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PULSE_COOKIE="$XDG_CONFIG_HOME"/pulse/cookie
export ENV="$XDG_CONFIG_HOME"/shells/ksh/kshrc
export ZDOTDIR="$XDG_CONFIG_HOME"/shells/zsh
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

jdm
