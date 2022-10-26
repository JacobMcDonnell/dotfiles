source ~/.zprofile
export SHELLDIR="$XDG_CONFIG_HOME/shells"
export ZSH="$SHELLDIR/zsh"
autoload -U +X compinit
compinit -d $XDG_CACHE_HOME/zcompdump-artix-5.8
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $SHELLDIR/aliasrc
source $SHELLDIR/dirrc
source $SHELLDIR/colorsrc # contians color substituions
source $SHELLDIR/cpwdrc # contains _collapsed_pwd
bindkey -v
HISTFILE="$XDG_CACHE_HOME/zshHIST"
SAVEHIST=100
HISTSIZE=5000
setopt prompt_subst
autoload -U colors && colors
#PROMPT='%{$fg_bold[$shColor]%}%n%{$reset_color%}@%m\
#:[%{$fg_bold[$shColor]%}$(_collapsed_pwd)%{$reset_color%}]:$ '
#PROMPT='%{$fg_bold[$shColor]%}$comSym%{$reset_color%}:[%{$fg_bold[$shColor]%}%c%{$reset_color%}]:$ '
python $HOME/.local/bin/days2finals.py
PROMPT='%{$fg_bold[$shColor]%}$comSym%{$reset_color%} in %{$fg_bold[$shColor]%}%c%{$reset_color%}
→ '
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/fzf-tab/fzf-tab.zsh
source $SHELLDIR/funcrc

