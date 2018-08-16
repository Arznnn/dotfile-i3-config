#!/bin/bash

scrot /tmp/screen.png

convert /tmp/screen.png -paint 1 -swirl 360 ~/shellscripts/lock.png -gravity center -composite -matte /tmp/screen.png

i3lock -i /tmp/screen.png

rm /tmp/screen.png
