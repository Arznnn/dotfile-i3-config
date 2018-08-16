#!/bin/bash
######################################################################
#
# bildschirm
# Bildschirme/Beamer steuern und verwalten
#
# Copyright 2011 Emanuel Duss
# Licensed under GNU General Public License
#
# 2011-07-26; Emanuel Duss; Erste Version
# 2012-08-26; Emanuel Duss; $CLONERES automatisch bestimmen
#
######################################################################

######################################################################
# Variabeln
INTERN="eDP1"
EXTERN="VGA1"

######################################################################
# Funktionen

PrintUsage(){
cat << EOI
Usage:
 bildschirm < modes | intern | extern | clone | extend >

Optionen:
  modes    Moegliche Modes ausgeben
  intern   Nur internen Bildschirm verwenden
  extern   Nur externer Bildschirm verwenden
  clone    Gleiche Ausgabe auf beiden Bildschirmen
  extend   Bild auf externem Bildschirm erweitern

EOI
}

######################################################################
# Main
case $1 in
  modes)
    xrandr -q
    ;;
  intern)
    xrandr --output $INTERN --auto --output $EXTERN --off
    ;;
  extern)
    xrandr --output $INTERN --off --output $EXTERN --auto
    ;;
  clone)
    CLONERES=`xrandr --query | awk '/^ *[0-9]*x[0-9]*/{ print $1 }' | sort -n | uniq -d | tail -1`
    xrandr --output $INTERN --mode $CLONERES --output $EXTERN --same-as $INTERN --mode $CLONERES
    ;;
  extend)
    xrandr --output $INTERN --auto --output $EXTERN --auto --right-of $INTERN
    # xrandr --output $EXTERN --mode $EXTRES --pos 1280x0 --output $INTERN --mode $INTRES --pos 0x400
    ;;
  *)
    PrintUsage
    ;;
esac

# EOF

