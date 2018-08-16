##############################################################
# This script disables tapping/scrolling while typing and
# enables touchpads clicking area (left, middle, right click) 
##############################################################
#!/bin/bash 
gsettings set org.gnome.settings-daemon.peripherals.touchpad disable-while-typing false  
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Scrolling Distance" 35, 35 # scroll more responsive
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Finger" 1, 15, 50 # ups click sensitivity
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Tap FastTap" 1 # faster taps
xinput set-button-map 12 1 2 3 5 4 7 6 # inverse scrolling
syndaemon -i 1.7 -d -t -K 
