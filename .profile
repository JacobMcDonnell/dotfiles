# Default programs:
export PATH=$PATH:$HOME/.local/bin
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export FILE="ranger"
export PICTURE="feh"

# Setting up XDG Dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Moving Folder and Files from ~/
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

jdm
[ "$(pstree | grep rio | sed "s/\s*//g;s/|//g;s/-//g;s/\`//g")" = "rio" ] && export SHELL=$PLAN9/bin/rc
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
#[ "$(tty)" = "/dev/tty2" ] && ! pgrep -x Xorg >/dev/null && export SHELL=$PLAN9/bin/rc && exec startx /usr/lib/plan9/bin/rio
