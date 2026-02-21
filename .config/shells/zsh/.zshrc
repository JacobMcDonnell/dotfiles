if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

color_wrap() {
    printf "%s%s%s" %{$fg_bold[$1]%} $2 %{$reset_color%}
}

git_good() {
    REPO="$(git config --get remote.origin.url 2>/dev/null | sed -n -E 's|.*/(.*)\.git|\1|p' | tr -d '\n' )"
    BRANCH="$(git branch 2>/dev/null | sed -n -E 's/\* (.*)/\1/p' | tr -d '\n')"
    [[ -n $BRANCH ]] && color_wrap cyan "[$REPO::$BRANCH] "
}

error_code() {
    if [[ $1 != 0 ]];
    then
        color_wrap red "["$1"]"
    fi
}

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
PROMPT='%{$fg_bold[$shColor]%}$comSym%{$reset_color%} in %{$fg_bold[$shColor]%}%c%{$reset_color%} $(ret=$?; git_good ; error_code $ret)
→ '
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/plugins/fzf-tab/fzf-tab.zsh
source $SHELLDIR/funcrc

