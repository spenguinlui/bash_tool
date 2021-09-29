#!/bin/bash

# 辨識路徑下的資料夾內所有圖片，如果沒有 gps 資訊則塞入假座標，約在台北市大同區附近

path=~/Desktop/pictures/*
# DIR=~/Desktop/pictures

count=0

for file in ${path}; do
  exiftool '-XMP:GPSLatitude<GPSLatitude' "-XMP:GPSLatitude=25.07${count}6" -if 'not $GPSLatitude' '-XMP:GPSLongitude<GPSLongitude' "-XMP:GPSLongitude=121.51${count}66" -if 'not $GPSLongitude' ${file}
  count=$(( $count + 1 ))
done

# exiftool -r -if -GPSLatitude $DIR