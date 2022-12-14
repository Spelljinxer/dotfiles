#!/bin/bash

# Import the colors
. "${HOME}/.cache/wal/colors.sh"
killall -q polybar
while pgreg -u $UID -x polybar >/dev/null; do sleep 1; done
PANEL_FIFO=/tmp/panel-fifo
HEIGHT=56
WIDTH=1920
XOFFSET=0
YOFFSET=0
DIM=${WIDTH}x${HEIGHT}+${XOFFSET}+${YOFFSET}
FONT0="-lucy-tewi-medium-r-normal-*-11-90-100-100-c-60-iso10646-1"
FONT1="-wuncon-siji-medium-r-normal-*-10-100-75-75-c-80-iso10646-1"
WM_NAME=panel-i3

if xdo id -a "$WM_NAME" > /dev/null
then
	  printf "%s\n" "The panel is already running." >&2
	  exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

## format an icon
icon() {
    case $2 in
        1) printf "%s" "%{F$color1}${1}%{F-}";;
        2) printf "%s" "%{F$color2}${1}%{F-}";;
        3) printf "%s" "%{F$color3}${1}%{F-}";;
        4) printf "%s" "%{F$color4}${1}%{F-}";;
        5) printf "%s" "%{F$color5}${1}%{F-}";;
        6) printf "%s" "%{F$color6}${1}%{F-}";;
    esac
}

## write pipe
# wm
while :; do
    desk=$(xdotool get_desktop)
    wm=$(($desk + 1))
    case "$wm" in
        1) echo 'W' "$(icon  1)";;
        2) echo 'W' "$(icon  1)";;
        3) echo 'W' "$(icon  1)";;
        4) echo 'W' "$(icon  1)";;
        5) echo 'W' "$(icon  1)";;
        6) echo 'W' "$(icon  1)";;
    esac
    sleep 0.4;
done > $PANEL_FIFO &

# music player
while :; do
    status=$(mpc status | sed -n '2p')
    case "$status" in
        \[play*)    echo 'M' "$(icon  1) $(mpc current)";;
        \[paused*)  echo 'M' "$(icon  1) $(mpc current)";;
        *)          echo 'M' "$(icon  5) Stopped";;
    esac
    sleep 2;
done > $PANEL_FIFO &

# net
while :; do
		network_id=$(/sbin/iwgetid -r)
		if [ -n "$network_id" ]
		then
		echo 'N' "$(icon  1) "$network_id"";
		else
        echo 'N' "$(icon  1) offline";
		fi
		sleep 8;
done > $PANEL_FIFO &

# bat
while :; do
		battery_status=$(cat /sys/class/power_supply/BAT0/status)
		battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
		case "$battery_status" in
			Charging) echo 'B' "$(icon  1) ${battery_percent}";;
			Discharging)
			if [ "$battery_percent" -gt 80 ]
            then
            echo 'B' "$(icon  1) ${battery_percent}"
            elif [ "$battery_percent" -gt 30 ]
            then
            echo 'B' "$(icon  1) ${battery_percent}"
            else
            echo 'B' "$(icon  1) ${battery_percent}"
            fi
            ;;
        Unknown|Full) echo 'B' "$(icon  1) 100%";;
    esac
    sleep 30;
done > $PANEL_FIFO &
		
# clock
while :; do
    echo 'C' "$(icon  1) $(date '+%H:%M')";
    sleep 30;
done > $PANEL_FIFO &


## read pipe
while read -r line < "$PANEL_FIFO" ; do
    case $line in
        C*)
            # clock output
            clock="%{F$foreground}%{B$background} ${line#?} %{B-}%{F-}";;
        M*)
            # music output
            music="%{F$foreground}%{B$background} ${line#?} %{B-}%{F-}";;
        W*)
            # wm
            wm="%{F$foreground}%{B$background} ${line#?} %{B-}%{F-}";;
        B*)
            # bat
            bat="%{F$foreground}%{B$background} ${line#?} %{B-}%{F-}";;
        N*)
            # net
            net="%{F$foreground}%{B$background} ${line#?} %{B-}%{F-}";;
    esac
    printf "%s\n" "%{l}${wm}%{c}${music}%{r}${net}${bat}${clock} "
done |\

    lemonbar -n "$WM_NAME" \
             -g "$DIM" \
             -f "$FONT0" -f "$FONT1" \
             -F "$foreground" -B "$background" |
    sh &

wait
