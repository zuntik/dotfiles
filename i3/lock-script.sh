#!/bin/bash

# Turn off touchpads for synaptics

# location for the image
image=/tmp/screen.png
# get the screenshot
scrot "$image"
# add the blur
convert "$image" -scale 10% -scale 1000% "$image"
# lock the screen
i3lock -i "$image"
# cleanup image
rm "$image"
