#!/bin/bash
rm withfish.mp4
rm nofish.mp4
ffmpeg -i $1 -t 60 -vf frei0r=defish0r:0.8:y:0.6:0,drawtext="fontfile='Liberator.ttf':text='After:fontsize=200:fontcolor=red:x=100:y=100"  -pix_fmt yuv420p -acodec copy nofish.mp4
ffmpeg -i $1 -t 60 -vf drawtext="fontfile='Liberator.ttf':text='Before:fontsize=200:fontcolor=red:x=100:y=100" -pix_fmt yuv420p -acodec copy withfish.mp4
#ffmpeg -i withfish.mp4 -i nofish.mp4 -filter_complex "[0:v]setpts=PTS-STARTPTS, pad=iw*2:ih[bg]; [1:v]setpts=PTS-STARTPTS[fg]; [bg][fg]overlay=w; amerge,pan=stereo:c0<c0+c2:c1<c1+c3" PLEASE.mp4
ffmpeg -i withfish.mp4 -i nofish.mp4 -filter_complex "[0:v]setpts=PTS-STARTPTS, pad=iw*2:ih[bg]; [1:v]setpts=PTS-STARTPTS[fg]; [bg][fg]overlay=w" $2

