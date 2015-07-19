#!/bin/bash
ffmpeg -i $1 -i $2 -filter_complex "[0:v]setpts=PTS-STARTPTS, pad=iw*2:ih[bg]; [1:v]setpts=PTS-STARTPTS[fg]; [bg][fg]overlay=w; amerge,pan=stereo:c0<c0+c2:c1<c1+c3" $3

