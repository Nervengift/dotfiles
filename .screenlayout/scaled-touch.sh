#!/bin/sh
d=1.4055636896046853 #1920/1366
xrandr --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output LVDS1 --mode 1366x768 --pos 0x0 --scale $d\x$d --rotate inverted --output VGA1 --off
`dirname "$0"`/_fix_touch.sh inverted
