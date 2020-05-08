# Default programs:
export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export FILE="lf"
export PICTURE="feh"

# Setting up XDG Dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Moving Folder and Files from ~/
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export STARDICT_DATA_DIR="$XDG_DATA_HOME"/stardict
export SDCV_HISTSIZE="$XDG_CACHE_HOME"/sdcv_history

jdm
