#!/bin/bash

# Turn off touchpads for synaptics

# location for the image
image=/tmp/screen.png
# get the screenshot
scrot "$image"
# add the blur
#convert "$image" -scale 10% -scale 1000% "$image"
#convert "$image" -filter Gaussian -resize "250.00" -define "filter:sigma=.6" -resize "1366x768^" -gravity center -extent "1366x768^" "$image"
#convert "$image" -filter Gaussian -resize "175.00" -define "filter:sigma=.6" -resize "1366x768^" -gravity center -extent "1366x768^" "$image"
convert "$image" -filter Gaussian -resize "300.00" -define "filter:sigma=.9" -resize "1366x768^" -gravity center -extent "1366x768^" "$image"
# lock the screen
i3lock -e -i "$image"
# cleanup image
rm "$image"
