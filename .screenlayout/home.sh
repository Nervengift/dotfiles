#!/bin/sh
#xrandr --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --output LVDS1 --mode 1366x768 --scale 1x1 --pos 0x1080 --rotate normal --output VGA1 --off
xrandr --output HDMI1 --mode 1920x1080 --primary; sleep 5 #Hack to prevent X crash
xrandr --output VIRTUAL1 --off --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x488 --rotate normal --output LVDS1 --off --output VGA1 --mode 1680x1050_60.00 --pos 1920x0 --rotate left
`dirname "$0"`/_fix_touch.sh
~/bin/random-bg.sh
i3-msg restart # fix systray
