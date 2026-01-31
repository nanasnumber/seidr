#!/bin/bash

tcStart=$2
tcEnd=$3
videoSrc=$1
userOffset=${4:-0}  # default to 0 if not passed
baseOffset=656      # center position
finalOffset=$((baseOffset + userOffset))
videoID=$(~/program/yt-dlp/yt-dlp.sh --get-id $videoSrc)
renderDIR=render
cacheDIR=cache

mkdir -p cache render

echo "Downloading video source from [$videoID]..."

~/program/yt-dlp/yt-dlp.sh $videoSrc -o $videoID.mp4

mv $videoID.mp4 $cacheDIR/

echo "[generating short] offset=$finalOffset (user offset=$userOffset)"

ffmpeg -i $cacheDIR/$videoID.mp4 -ss $tcStart -to $tcEnd -filter:v "crop=608:1080:$finalOffset:0" -c:a copy $renderDIR/[short]--[$videoID].mp4



