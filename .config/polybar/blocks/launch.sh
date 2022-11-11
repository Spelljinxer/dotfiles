#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# polybar -rq dummy & 
polybar -c ~/.config/polybar/blocks/config.ini -rq music &
polybar -c ~/.config/polybar/blocks/config.ini -rq tray &
polybar -c ~/.config/polybar/blocks/config.ini -rq i3 &

echo "Polybar launched..."
