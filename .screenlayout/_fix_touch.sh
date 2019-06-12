echo Mapping touch screen to internal display...
xsetwacom list devices | sed 's/id: .*//' | while read device
do
    xsetwacom set "$device" MapToOutput "eDP-1"
	[ "x$1" == "xinverted" ] && xsetwacom set "$device" Rotate half || xsetwacom set "$device" Rotate none
done
