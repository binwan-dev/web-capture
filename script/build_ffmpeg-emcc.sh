#!/bin/bash

FFMPEG_PATH=$1
if [ ! -n "$FFMPEG_PATH" ]; then
    echo "please input ffmpeg dir!"
    exit -1
fi

echo "===== start build ffmpeg-emcc ====="

NOW_PATH=$(cd $(dirname $0); pwd)

WEB_CAPTURE_PATH=$(cd $NOW_PATH/../; pwd)

rm -rf  $WEB_CAPTURE_PATH/lib/ffmpeg-emcc

mkdir $WEB_CAPTURE_PATH/lib/ffmpeg-emcc

cd $FFMPEG_PATH

make clean

emconfigure ./configure \
    --prefix=$WEB_CAPTURE_PATH/lib/ffmpeg-emcc \
    --cc="emcc" \
    --cxx="em++" \
    --ar="emar" \
    --ranlib="emranlib" \
    --nm="emnm" \
    --cpu=generic \
    --target-os=none \
    --arch=x86_32 \
    --enable-gpl \
    --enable-version3 \
    --enable-cross-compile \
    --disable-logging \
    --disable-programs \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-doc \
    --disable-swresample \
    --disable-postproc  \
    --disable-avfilter \
    --disable-pthreads \
    --disable-w32threads \
    --disable-os2threads \
    --disable-network \
    --disable-asm \
    --disable-debug \
    --disable-stripping

emmake make

make install

echo "===== finish build ffmpeg-emcc ====="