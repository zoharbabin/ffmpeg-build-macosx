#!/bin/bash
rm dummy.mp4
rm defished.mp4
ffmpeg -i $1 -vf frei0r=defish0r:0.8:y:0.6:0 -vcodec libx264 -pix_fmt yuv420p -acodec copy defished.mp4
ffmpeg -i defished.mp4 -vf vidstabdetect=accuracy=15:shakiness=10:result="mytransforms.trf" vidstabanalyzedummy.mp4
ffmpeg -i defished.mp4 -vcodec libx264 -vf vidstabtransform=input="mytransforms.trf",unsharp=5:5:0.8:3:3:0.4 -pix_fmt yuv420p -acodec copy $2
