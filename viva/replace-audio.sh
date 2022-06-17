#
in=1a9eb5e2-16ca-4014-86b0-ee8f7ea67da1.MP4
ffmpeg -i $in -vn audio.aac
ffmpeg -i $in -an -vcodec copy video.mp4
audio=3c90dc8c-ade9-49f1-a9af-1473a280dcca_enhanced.wav
ffmpeg -i "$in" -i "$audio" -vcodec copy -acodec aac -map 0:v:0 -map 1:a:0 "phx-pitch-at-vivatech2022.mp4"

