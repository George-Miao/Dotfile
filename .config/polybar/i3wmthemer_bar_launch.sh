#!/bin/env sh

pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar -r -q left & \
polybar -r -q music & \
polybar -r -q right & \

sleep 1;