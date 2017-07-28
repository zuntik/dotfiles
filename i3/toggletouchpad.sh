#!/usr/bin/bash

STATE=$(synclient | grep  TouchpadOff)
VALUE=${STATE##* }

if [ $VALUE -eq 1 ];then
    synclient TouchpadOff=0
else
    synclient TouchpadOff=1
fi

synclient TapButton1=1
synclient TapButton2=3
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient ClickFinger2=3
