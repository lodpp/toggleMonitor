# toggleMonitor

Goal:
This udev rule and bash script is used to switch from Single to Dual Head monitor configuration when a new monitor is
plugged from my laptop. It will also do the reverse Dual to Single Head once you unplugged the monitor

It's not universal as it depends on udev matching, monitor port ; but it's a good start anyway :) 

Setup:
Laptop: Thinkpad X201 (no Docking Station), 2nd monitor port: VGA
OS: Linux Slackware 14.1 64b
WM: Awesome v3.5.5
2nd Monitor: Benq XL2720Z on it's VGA interface

The udev rule has to be place in /etc/udev/rules/
I placed the bash script in /etc/udev/scripts/
Feel free to change it if you want, remember to change the path to the script in the udev rule file


How is it working:
1- create the udev rule
I used:
        udevadm monitor --property
to get the event once I plug/unplug the monitor

From this I was able to create the udev rule to match the event and execute the script.

2- 
