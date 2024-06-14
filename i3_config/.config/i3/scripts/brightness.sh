#!/bin/bash

MON="eDP-1"    # Discover monitor name with: xrandr | grep " connected"
STEP=10          # Step Up/Down brightnes by: 5 = ".05", 10 = ".10", etc.

# Always returns the same icon - I couldn't get the brightness-low icon to work with fontawesome
function get_brightness_icon {
    brightness_icon=""
}

# Uses regex to get brightness from xbacklight
CurrBright=$( xrandr --verbose --current | grep ^"$MON" -A5 | tail -n1 )
CurrBright="${CurrBright##* }"  # Get brightness level with decimal place

Left=${CurrBright%%"."*}        # Extract left of decimal point
Right=${CurrBright#*"."}        # Extract right of decimal point

MathBright="0"
[[ "$Left" != 0 && "$STEP" -lt 10 ]] && STEP=10     # > 1.0, only .1 works
[[ "$Left" != 0 ]] && MathBright="$Left"00          # 1.0 becomes "100"
[[ "${#Right}" -eq 1 ]] && Right="$Right"0          # 0.5 becomes "50"
MathBright=$(( MathBright + Right ))

[[ "$1" == "Up" || "$1" == "+" ]] && MathBright=$(( MathBright + STEP ))
[[ "$1" == "Down" || "$1" == "-" ]] && MathBright=$(( MathBright - STEP ))
[[ "$MathBright" -lt 10  ]] && MathBright=10    # Negative not allowed
[[ "$MathBright" -gt 100  ]] && MathBright=100      # Can't go over 9.99

NotifyBright=$MathBright
if [[ "${#MathBright}" -eq 3 ]] ; then
    MathBright="$MathBright"000         # Pad with lots of zeros
    CurrBright="${MathBright:0:1}.${MathBright:1:2}"
else
    MathBright="$MathBright"000         # Pad with lots of zeros
    CurrBright=".${MathBright:0:2}"
fi

xrandr --output "$MON" --brightness "$CurrBright"   # Set new brightness

get_brightness_icon
dunstify -t 1000 -r 2593 -u normal "$brightness_icon $NotifyBright%" -h int:value:$NotifyBright -h string:hlcolor:$bar_color


# Display current brightness
printf "Monitor $MON "
echo $( xrandr --verbose --current | grep ^"$MON" -A5 | tail -n1 )

