#!/bin/sh
xrandr --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --primary --mode 2560x1440 --pos 1920x0 --rotate normal --output eDP-1 --mode 1920x1080 --pos 0x696 --rotate normal --output DP-2 --off
`dirname "$0"`/_fix_touch.sh
~/bin/random-bg.sh
i3-msg restart # fix systray
