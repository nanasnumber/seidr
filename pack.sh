#/bin/bash

# ffmpeg -loop 1 -i ~/design/brewthewax/yt-thumb-remix-mobb-deep-the-realest.jpg -i ~/audio-production/renoise/dragging.wav -c:v libx264 -c:a aac -b:a 320k -shortest -pix_fmt yuv420p remix-series-mobb-deep-the-realest.mp4


# ffmpeg -i jlfbbb-series-dragging-square.mp4 -ss 00:00:00 -to 00:00:55 jlfbbb-series-dragging-tiktok.mp4

# convert cover-jlfbbb-series-reefer.png -resize 1920x -gravity center -crop 1920x1080+0+0 +repage yt-thumb-jlfbbb-series-reefer.jpg



cover="./cover.png"
audio="./audio.wav"
dist="dist"

rm -rf ./$dist/
mkdir $dist

# crop cover to yt thumbnail
convert $cover -resize 1920x -gravity center -crop 1920x1080+0+0 +repage yt-thumb.jpg

# generate the full length video
ffmpeg -loop 1 -i ./yt-thumb.jpg -i ./audio.wav -c:v libx264 -c:a aac -b:a 320k -shortest -pix_fmt yuv420p ./dist/16-9.mp4
ffmpeg -loop 1 -i ./cover.png -i ./audio.wav -c:v libx264 -c:a aac -b:a 320k -shortest -pix_fmt yuv420p ./dist/1-1.mp4
ffmpeg -i ./dist/1-1.mp4 -ss 00:00:00 -to 00:00:55 ./dist/1-1--55s.mp4
