export PLAN9=$HOME/personal/plan9
export PATH=/opt/MaXX/bin:/usr/dt/bin:~/personal/bin:~/.local/bin:$PATH:$HOME/go/bin:$PLAN9/bin

export EDITOR=nvim
export HOMEBREW_EDITOR=nvim

# Shell settings
export shColor=green
export OS="$(uname -s)"
if [[ $OS == "Darwin" ]]; then
	export comSym=
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ $OS == "Linux" ]]; then
	export comSym=λ
fi

# Setting up XDG Dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Moving Folder and Files from ~/
export LESSHISTFILE=-
export ENV="$XDG_CONFIG_HOME"/shells/ksh/kshrc
export ZDOTDIR="$XDG_CONFIG_HOME"/shells/zsh

