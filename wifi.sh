#!/bin/sh
 
while true
do
    iwconfig  wlan0 | grep Link | awk '{$1=$1;print}'
    sleep 1
done
