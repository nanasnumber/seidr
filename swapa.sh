#!/bin/bash

target=$1
audioSrc=$2

echo "[swapping audio]"

ffmpeg -i $target -i $audioSrc -c:v copy -map 0:v:0 -map 1:a:0 $target-audio-swapped.mp4
