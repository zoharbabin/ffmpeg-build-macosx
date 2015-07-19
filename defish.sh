#!/bin/bash
ffmpeg -i $1 -vf frei0r=defish0r:0.8:y:0.6:0 -vcodec libx264 -pix_fmt yuv420p -acodec copy $2
