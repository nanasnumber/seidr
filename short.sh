#!/bin/bash

tcStart=$2
tcEnd=$3
videoSrc=$1
userOffset=${4:-0}  # default to 0 if not passed
baseOffset=656      # center position
finalOffset=$((baseOffset + userOffset))

echo "[generating short] offset=$finalOffset (user offset=$userOffset)"

ffmpeg -ss $tcStart -to $tcEnd -i $videoSrc -filter:v "crop=608:1080:$finalOffset:0" -c:a copy $videoSrc--short.mp4

