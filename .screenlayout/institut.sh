#!/bin/sh
xrandr --output VIRTUAL1 --off --output DP2 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --primary --mode 1366x768 --pos 0x1050 --rotate normal --output VGA1 --mode 1920x1200 --pos 1366x0 --rotate normal
`dirname "$0"`/_fix_touch.sh
~/bin/random-bg.sh
i3-msg restart # fix systray
sleep 1
i3-msg workspace "12:" && i3-msg move workspace to output LVDS1
