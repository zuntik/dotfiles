#!/bin/bash

if [ ! -x /usr/bin/i3lock ]; then
    notify-send "no i3lock"
fi

# location for the image
image=/tmp/screen.png
# get the screenshot
if [ -x /usr/bin/scrot ]; then
    scrot "$image"
fi
# add the blur
#convert "$image" -scale 10% -scale 1000% "$image"
#convert "$image" -filter Gaussian -resize "250.00" -define "filter:sigma=.6" -resize "1366x768^" -gravity center -extent "1366x768^" "$image"
#convert "$image" -filter Gaussian -resize "175.00" -define "filter:sigma=.6" -resize "1366x768^" -gravity center -extent "1366x768^" "$image"
if [ -x /usr/bin/convert ]; then
    convert "$image" -filter Gaussian -resize "300.00" -define "filter:sigma=.9" -resize "1920x1080^" -gravity center -extent "1920x1080^" "$image"
fi
# lock the screen
if [ -x /usr/bin/physlock ]; then
    physlock -l ;
fi
i3lock -n -e -i "$image"

if [ ! -x /usr/bin/scrot ]; then
    notify-send "remember to install scrot";
fi

if [ ! -x /usr/bin/convert ]; then
    notify-send "remember to install imagemagick";
fi

if [ -x /usr/bin/physlock ]; then
    physlock -L ;
else
    notify-send "remember to install physlock";
fi
# cleanup image
rm "$image"
