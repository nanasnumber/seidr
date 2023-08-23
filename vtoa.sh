#!/bin/bash

target=$1

echo "[video>>>audio]"

ffmpeg -i $target -vn -acodec pcm_s16le -ar 44100 -ac 2 ${target/.mp4/.wav}
