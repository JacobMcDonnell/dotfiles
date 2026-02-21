if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

source ~/.zprofile
export SHELLDIR="$XDG_CONFIG_HOME/shells"
export ZSH="$SHELLDIR/zsh"
autoload -U +X compinit
compinit -d $XDG_CACHE_HOME/zcompdump
fpath=($ZSH/plugins/zsh-completions/src $fpath)

for CONFIG_FILE in $SHELLDIR/utils/*;
do
    [[ -f $CONFIG_FILE ]] && source $CONFIG_FILE
done

export OS="$(uname -s)"
for CONFIG_FILE in $SHELLDIR/utils/$OS/*;
do
    [[ -f $CONFIG_FILE ]] && source $CONFIG_FILE
done

bindkey -v
bindkey -s ^f "tmux-sessionizer\n"
HISTFILE="$XDG_CACHE_HOME/zshHIST"
SAVEHIST=100
HISTSIZE=5000
setopt prompt_subst
autoload -U colors && colors
PROMPT='%{$fg_bold[$shColor]%}$comSym%{$reset_color%} in %{$fg_bold[$shColor]%}%~%{$reset_color%} $(ret=$?; git_good ; error_code $ret)
→ '
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/fzf-tab/fzf-tab.zsh

