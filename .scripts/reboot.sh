#!/bin/bash

[ $(echo -e "Yes\nNo" | dmenu -i -p "Sure wanna reboot?") \
== "Yes" ] && reboot
