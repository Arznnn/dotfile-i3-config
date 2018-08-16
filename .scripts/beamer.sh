xrandr --output HDMI1 --mode 1920x1080 
xrandr --query | awk '/^ *[0-9]*x[0-9]*/{ print $1 }' | sort -n | uniq -d | tail -1

