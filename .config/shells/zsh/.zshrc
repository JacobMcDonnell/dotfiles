if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

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
bindkey -s ^f "tmux-sessionizer\n"
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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jmm/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jmm/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jmm/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jmm/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

