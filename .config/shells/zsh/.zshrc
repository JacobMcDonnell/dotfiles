export SHELLDIR="$XDG_CONFIG_HOME/shells"
export ZSH="$SHELLDIR/zsh"
autoload -U +X compinit
compinit -d $XDG_CACHE_HOME/zcompdump-artix-5.8
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $SHELLDIR/aliasrc
source $SHELLDIR/colorsrc # contians color substituions
source $SHELLDIR/cpwdrc # contains _collapsed_pwd
source $ZSH/plugins/fzf-tab/fzf-tab.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey -v
HISTFILE="$XDG_CACHE_HOME/zshHIST"
SAVEHIST=100
HISTSIZE=5000
setopt prompt_subst
PS1='$(printf "${BOLD}${BLUE}%s${NORM}${BOLD}@%s:[${BLUE}%s${NORM}${BOLD}]:$ " $USER $(hostname) "$(_collapsed_pwd)" )'
