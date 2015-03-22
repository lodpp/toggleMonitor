#! /bin/sh

#Find who is connected on the system to export appropriate Xauth file and display
X_DISPLAY=$(w -h -s | grep ":[0-9]\W" | head -1 | awk '{print $3}')
X_AUTHORITY=$(w -h -s | grep ":[0-9]\W" | head -1 | awk '{print $1}')

export XAUTHORITY=/home/$X_AUTHORITY/.Xauthority
export DISPLAY=$X_DISPLAY

#On my thinkpad X201, I can attach only a VGA monitor to it (without a dock)
#So I check only if the VGA1 is connected or not, it could worth a try with a dock and its hdmi/dp
INT_MONITOR="LVDS1"
EXT_VGA_MONITOR="VGA1"

if ( xrandr | grep "$EXT_VGA_MONITOR disconnected" )
then
	echo "VGA1 is disconnected ! too bad !"	

	#set the internal monitor as primary and turn off the external monitor
	xrandr --output $INT_MONITOR --auto --primary
	xrandr --output $EXT_VGA_MONITOR --off

elif ( xrandr | grep "$EXT_VGA_MONITOR connected" )
then
	echo "VGA1 is connected ! yeah!"

	#set the internal monitor as primary and set the external monitor to its right 
	xrandr  --output $INT_MONITOR --auto --primary --output VGA1 --auto --right-of LVDS1
fi
