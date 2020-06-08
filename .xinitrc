#!/bin/sh
#exec /usr/bin/xrandr --output HDMI-1 --mode 1360x768 --above eDP-1 &
exec $HOME/.local/bin/setWall /home/jacob/Pictures/Wallpapers -p &
exec /usr/bin/compton &
exec /usr/local/bin/dwmblocks &
exec /usr/local/bin/dwm
