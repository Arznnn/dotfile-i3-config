#!/bin/bash
# export DISPLAY=:0.0 && export XAUTHORITY=/home/jansen/.Xauthority && sudo -u jansen /usr/bin/notify-send "Test crontab ..."
export DISPLAY=:0.0 && /usr/bin/notify-send "Test crontab ..."
echo "test" > /tmp/obnam.txt
echo obnam clients > /tmp/obnam.clients
