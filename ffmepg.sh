#!/bin/sh

# -y 덮어쓰기
# -an noaudio
# -c:v video codec
# -c:a  audio
export OUT=test3.mp4
rm ${OUT}
ffmpeg  -f mjpeg -y \
        -use_wallclock_as_timestamps 1 \
        -i 'http://localhost:8080/?action=stream_0' \
        -reconnect 1 \
        -c:v  h264_omx \
        -q:v 1 \
        -b:v 1500k \
        -c:a copy \
        -pix_fmt yuv420p \
        -r 15 \
        -an -qscale 10  \
        ${OUT}