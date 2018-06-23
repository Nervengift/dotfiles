#!/bin/sh
xrandr --output VIRTUAL1 --off --output DP2 --off --output DP1 --mode 1920x1080 --pos 0x0 --rotate normal --primary --output HDMI2 --off --output HDMI1 --off --output LVDS1 --off --output VGA1 --mode 1920x1080 --pos 1920x0 --rotate normal
`dirname "$0"`/_fix_touch.sh
~/bin/random-bg.sh
i3-msg restart # fix systray
