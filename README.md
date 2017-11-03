Bash script to build and install ffmpeg on Mac OSX and Linux
==========

Enhanced version of https://github.com/rtgoodwin/ffmpeg-build-script-plus-frei0r-freetype and its source https://github.com/markus-perl/ffmpeg-build-script .

The original build script provides an easy way to build ffmpeg on OSX and Linux with non-free codecs in addition to the frei0r plugins (for doing fisheye removal on cameras like GoPro, Mobius, etc.), Freetype (for doing text overlays) and fontconfig (plus dependency libxml2).

This version also adds support for [avfoundation](https://www.ffmpeg.org/ffmpeg-devices.html#avfoundation), and continued updates to latest versions.

## Supported Codecs
* x264: H.264 (MPEG-4 AVC)
* x265: H.265 Video Codec
* fdk_aac: Fraunhofer FDK AAC Codec 
* xvidcore: MPEG-4 video coding standard
* webm: WebM is a video file format
* mp3: MPEG-1 or MPEG-2 Audio Layer III
* ogg: Free, open container format
* vorbis: Lossy audio compression format
* theora: Free lossy video compression format

Requirements OSX
------------

* XCode 5.x or greater with command line tools installed. Use either the Xcode UI, or from the terminal:

```xcode-select --install```

Requirements Linux
------------
* Debian >= Wheezy, Ubuntu => Trusty, other Distros might work too
* build-essentials installed:

```
# Debian and Ubuntu
sudo apt-get install build-essential curl

# Fedora
sudo dnf install @development-tools
```

Installation
------------

### Quick install and run

Open your command line and run (needs curl to be installed):

```
bash <(curl -s https://raw.githubusercontent.com/zoharbabin/ffmpeg-build-macosx/master/web-install.sh?v1)
```
This command downloads the build script and automatically starts the build process.

### Common installation

```
git clone https://github.com/zoharbabin/ffmpeg-build-macosx.git
cd ffmpeg-build-script
./ffmpeg-build-script --help
```

Usage
------

```
./build-ffmpeg --help       Display usage information
./build-ffmpeg --build      Starts the build process
./build-ffmpeg --cleanup    Remove all working dirs
```


Contact
-------

You can file an issue on this repo; or tweet @zohar; or E-Mail at z [dot] babin (@) gmail .

If you'd like to contact the original creators:
* Github: [http://www.github.com/markus-perl](http://www.github.com/markus-perl)
* Github: [https://github.com/rtgoodwin](https://github.com/rtgoodwin)

Tested on
---------

* Mac OSX 10.11 64Bit XCode 7.*
* Debian 8.3

Example fisheye removal for GoPro/Mobius
-------
* For Mobius lens "C": 

```ffmpeg -i <inputfile> -vf frei0r=defish0r:0.8:y:0.6:0 -vcodec libx264 -pix_fmt yuv420p -acodec copy <outputfile.mp4>```

![Example of cleaned up image](https://github.com/rtgoodwin/ffmpeg-build-script-plus-frei0r-freetype/blob/master/compare.png)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fzoharbabin%2Fffmpeg-build-macosx.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fzoharbabin%2Fffmpeg-build-macosx?ref=badge_shield)

and another

![Example of cleaned up image](https://github.com/rtgoodwin/ffmpeg-build-script-plus-frei0r-freetype/blob/master/compare2.png)

(Blur at edges is in the original video; keep those lenses clean, people! :) )

* For GoPro (or other cameras with less barrel distortion):

```ffmpeg -i <inputfile> -vf frei0r=defish0r:0.75:y:0.6:0 -vcodec libx264 -pix_fmt yuv420p -acodec copy <outputfile.mp4>```



Example compilation output
-------

```
zohar.babin$ ./build-ffmpeg --build
ffmpeg-build-script v
=========================

Using 4 make jobs simultaneously.

building nasm
=======================
Downloading http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-2.13.01.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace
$ make -j 4
$ make install

building yasm
=======================
Downloading http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace
$ make -j 4
$ make install

building opencore
=======================
Downloading http://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.5.tar.gz?r=http0X0P+00.0000000.000000sourceforge.net0.000000projects0.000000opencore-amr0.000000files0.000000opencore-amr0.000000&ts=1442256558&use_mirror=netassist
Failed to download http://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-0.1.5.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fopencore-amr%2Ffiles%2Fopencore-amr%2F&ts=1442256558&use_mirror=netassist. Exitcode 18. Retrying in 10 seconds
... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-shared --enable-static
$ make -j 4
$ make install

building libvpx
=======================
Downloading https://github.com/webmproject/libvpx/archive/v1.5.0.tar.gz... Done
sed: -i may not be used with stdin
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-unit-tests --disable-shared
$ make -j 4
$ make install

building lame
=======================
Downloading http://kent.dl.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-shared --enable-static
$ make -j 4
$ make install

building xvidcore
=======================
Downloading http://downloads.xvid.org/downloads/xvidcore-1.3.4.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-shared --enable-static
$ make -j 4
$ make install
$ rm /Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib/libxvidcore.4.dylib

building x264
=======================
Downloading ftp://ftp.videolan.org/pub/x264/snapshots/x264-snapshot-20170328-2245.tar.bz2... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-shared --enable-static
$ make -j 4
$ make install
$ make install-lib-static

building libogg
=======================
Downloading http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-shared --enable-static
$ make -j 4
$ make install

building libvorbis
=======================
Downloading http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --with-ogg-libraries=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib --with-ogg-includes=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/include/ --enable-static --disable-shared --disable-oggtest
$ make -j 4
$ make install

building libtheora
=======================
Downloading http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --with-ogg-libraries=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib --with-ogg-includes=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/include/ --with-vorbis-libraries=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib --with-vorbis-includes=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/include/ --enable-static --disable-shared --disable-oggtest --disable-vorbistest --disable-examples --disable-asm
$ make -j 4
$ make install

building pkg-config
=======================
Downloading http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.1.tar.gz... Done
$ ./configure --silent --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --with-pc-path=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib/pkgconfig --with-internal-glib
$ make -j 4
$ make install

building freetype
=======================
Downloading http://download.savannah.gnu.org/releases/freetype/freetype-2.8.tar.gz... Done
$ ./configure --silent --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --with-pc-path=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib/pkgconfig --disable-shared --enable-static
$ make -j 4
$ make install

building fontconfig
=======================
Downloading http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.11.94.tar.gz... Done
$ ./configure --silent --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --with-pc-path=/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib/pkgconfig --disable-shared --enable-static
$ make -j 4
$ make install

building cmake
=======================
Downloading https://cmake.org/files/v3.5/cmake-3.5.2.tar.gz... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace
$ make -j 4
$ make install

building vid_stab
=======================
Downloading https://codeload.github.com/georgmartius/vid.stab/legacy.tar.gz/release-0.98b... Done
$ cmake -DCMAKE_INSTALL_PREFIX:PATH=/Users/zohar.babin/Downloads/ffmpeg-build/workspace .
$ make install

building x265
=======================
Downloading https://bitbucket.org/multicoreware/x265/downloads/x265_2.3.tar.gz... Done
$ cmake -DCMAKE_INSTALL_PREFIX:PATH=/Users/zohar.babin/Downloads/ffmpeg-build/workspace -DENABLE_SHARED:bool=off .
$ make -j 4
$ make install

building fdk_aac
=======================
Downloading http://downloads.sourceforge.net/project/opencore-amr/fdk-aac/fdk-aac-0.1.5.tar.gz?r=https0X0P+00.0000000.000000sourceforge.net0.000000projects0.000000opencore-amr0.000000files0.000000fdk-aac0.000000&ts=1457561564&use_mirror=kent... Done
$ ./configure --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --disable-shared --enable-static
$ make -j 4
$ make install

building frei0r
=======================
Downloading https://files.dyne.org/frei0r/releases/frei0r-plugins-1.6.1.tar.gz... Done
$ cmake -DCMAKE_INSTALL_PREFIX:PATH=/Users/zohar.babin/Downloads/ffmpeg-build/workspace .
$ make -s install

building ffmpeg
=======================
Downloading http://ffmpeg.org/releases/ffmpeg-3.3.4.tar.bz2... Done
$ ./configure --arch=64 --prefix=/Users/zohar.babin/Downloads/ffmpeg-build/workspace --extra-cflags=-I/Users/zohar.babin/Downloads/ffmpeg-build/workspace/include --extra-cflags=-I/Users/zohar.babin/Downloads/ffmpeg-build/workspace/include/vorbis --extra-cflags=-I/Users/zohar.babin/Downloads/ffmpeg-build/workspace/include/freetype2 --extra-ldflags=-L/Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib --extra-version=static --disable-debug --disable-shared --enable-static --enable-libopencore_amrwb --enable-libopencore_amrnb --extra-cflags=--static --disable-ffplay --disable-ffserver --disable-doc --enable-gpl --enable-version3 --enable-nonfree --enable-pthreads --enable-libvpx --enable-libmp3lame --enable-libtheora --enable-libvorbis --enable-libx264 --enable-libx265 --enable-runtime-cpudetect --enable-libfdk-aac --enable-avfilter --enable-libopencore_amrwb --enable-libopencore_amrnb --enable-filters --enable-libvidstab --enable-frei0r --enable-indev=avfoundation
$ make -j 4
$ make install

Building done. The binary can be found here: /Users/zohar.babin/Downloads/ffmpeg-build/workspace/bin/ffmpeg

Install the binary to your /usr/local/bin folder? [Y/n]

The frei0r plugins can be found here: /Users/zohar.babin/Downloads/ffmpeg-build/workspace/lib/ in a folder named "frei0r-1"

Copy frei0r plugins to your /usr/local/lib/frei0r-1 folder [Y/n]
```


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fzoharbabin%2Fffmpeg-build-macosx.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fzoharbabin%2Fffmpeg-build-macosx?ref=badge_large)