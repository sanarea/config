#!/bin/sh


mjpg_streamer -i "input_uvc.so -d /dev/video0 -n -f 15 -r 1280x720" \
                -i "input_uvc.so -d /dev/video4 -n -f 15 -r 1280x720" \
                -o "output_http.so -w /usr/share/mjpg_streamer/www  -p 8080"
 