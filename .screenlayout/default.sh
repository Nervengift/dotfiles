#!/bin/sh
xrandr --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x0 --scale 1x1 --rotate normal --primary --output VGA1 --off
`dirname "$0"`/_fix_touch.sh
~/bin/random-bg.sh
i3-msg restart # fix systray
