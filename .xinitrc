#!/bin/sh
#exec /usr/bin/xrandr --output HDMI-1 --mode 1360x768 --above eDP-1 &
exec $HOME/.local/bin/setWall $HOME/Pictures/Wallpapers -p &
exec /usr/bin/compton &
exec /usr/bin/dwmblocks &
exec /usr/bin/xset led 3 &
exec $HOME/.local/bin/keys &
exec /usr/bin/dwm
