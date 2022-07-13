#

# usage: 
# stitch $ytthumbnail.jpg . $podcastaudio.m4a
m=3
i=1
while [ -e podcast$m-$i.mp4 ]; do
  i=$(expr $i + 1)
done
echo i: $i;
convert "$1" -resize 1280x720 ytthumbnail.jpg
#convert "$1" -resize 1920x1080 ytthumbnail_1080p.jpg
thumb="ytthumbnail.jpg"
#ffmpeg -i ytthumbnail.jpg -i ${audio%.*}.m4a -c:a copy -pix_fmt yuv420p out.mp4
#add music 
cat > list.txt <<EOF
file intro-music.m4a
file PhX-and-JulieF-12-July-2022_v1.13-fapic.m4a
EOF
if [ ! -e concat.mp3 ]; then
ffmpeg -y -safe 0 -f concat -i list.txt concat.mp3
fi

if [ ! -e audio.mp3 ]; then
ffmpeg -y -i "intro-music.m4a" -i "$3" -filter_complex "[0:a:0][1:a:0]concat=n=2:v=0:a=1[outa]" \
-map "[outa]" audio.mp3
fi
if [ ! -e audio.m4a ]; then
ffmpeg -y -i "intro-music.m4a" -i "$3" -filter_complex "[0:a:0][1:a:0]concat=n=2:v=0:a=1[outa]" \
-map "[outa]" audio.m4a
fi

if [ ! -e out.mp4 ]; then
ffmpeg -y -i "$thumb" -i "audio.mp3" -r 1 -c:a copy -c:v libx264 -pix_fmt yuv420p out.mp4
fi
if true; then
#ffmpeg -y -i "$1" -i "audio.m4a" -pix_fmt yuv420p podcast$m-0.mp4
ffmpeg -r 1 -loop 1 -y -i "$thumb" -i audio.m4a -r 1 -shortest -pix_fmt yuv420p -c:a copy -c:v libx264 podcast$m-$i.mp4
fi

ls -l podcast$m-$i.mp4

