#!/bin/bash

target=$1

echo "[yt>>>mp3]"

~/program/yt-dlp/yt-dlp.sh -x --audio-format mp3 $target

