#!/usr/bin/env bash
export DISPLAY=:0
find "$HOME/.wallpaper" | sort -R | head -n1 | xargs feh --bg-fill
