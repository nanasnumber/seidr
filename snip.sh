#!/bin/bash

tcStart=$2
tcEnd=$3
videoSrc=$1

ffmpeg -i $videoSrc -ss $tcStart -to $tcEnd $videoSrc--snipped.mp4
