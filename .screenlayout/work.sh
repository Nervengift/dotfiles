#!/bin/sh
xrandr --output DP2 --off --output VGA1 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x936 --rotate normal --output DP1 --mode 1680x1050 --pos 1366x0 --rotate normal
`dirname "$0"`/_fix_touch.sh
~/bin/random-bg.sh
i3-msg restart
