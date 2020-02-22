## Arrow Key Functions
set -o emacs
alias __A=$(print '\0020') # ^P = up = previous command
alias __B=$(print '\0016') # ^N = down = next command
alias __C=$(print '\0006') # ^F = right = forward a character
alias __D=$(print '\0002') # ^B = left = back a character
alias __H=$(print '\0001') # ^A = home = beginning of line
alias ls='ls --color'

## Collapsed Directory
_collapsed_pwd() {
  pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
'
}

## Reset to normal: \033[0m
NORM="\033[0m"

## Colors:
BLACK="\033[0;30m"
GRAY="\033[1;30m"
RED="\033[0;31m"
LRED="\033[1;31m"
GREEN="\033[0;32m"
LGREEN="\033[1;32m"
YELLOW="\033[0;33m"
LYELLOW="\033[1;33m"
BLUE="\033[0;34m"
LBLUE="\033[1;34m"
PURPLE="\033[0;35m"
PINK="\033[1;35m"
CYAN="\033[0;36m"
LCYAN="\033[1;36m"
LGRAY="\033[0;37m"
WHITE="\033[1;37m"

## Backgrounds
BLACKB="\033[0;40m"
REDB="\033[0;41m"
GREENB="\033[0;42m"
YELLOWB="\033[0;43m"
BLUEB="\033[0;44m"
PURPLEB="\033[0;45m"
CYANB="\033[0;46m"
GREYB="\033[0;47m"

## Attributes:
UNDERLINE="\033[4m"
BOLD="\033[1m"
INVERT="\033[7m"

## Cursor movements
CUR_UP="\033[1A"
CUR_DN="\033[1B"
CUR_LEFT="\033[1D"
CUR_RIGHT="\033[1C"

## Start of display (top left)
SOD="\033[1;1f"


PS1=$(printf "${GREEN}%s${NORM}@%s:[${GREEN}%s${NORM}]:$ " '$USER' '$HOSTNAME' '$(_collapsed_pwd)')
