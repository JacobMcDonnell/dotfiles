# Default programs:
export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export FILE="lf"
export PICTURE="sxiv"

# Setting up XDG Dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Moving Folder and Files from ~/
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export RANDFILE="$XDG_DATA_HOME"/rnd/rnd
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export LESSHISTFILE="$XDG_CACHE_HOME"/lesshst
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

jdm
