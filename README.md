# toggleMonitor

Goal:
This udev rule and bash script is used to switch from Single to Dual Head monitor configuration when a new monitor is
plugged on my laptop. It will also do the reverse Dual to Single Head once you unplugged the monitor

It's not universal as it depends on udev matching, monitor port ; but it's a good start anyway :)

The udev rule has to be place in /etc/udev/rules/
I placed the bash script in /etc/udev/scripts/
Feel free to change it if you want, remember to change the path to the script in the udev rule file

Test setup: thinkpad x201 / Slackware 14.1 / 2nd monitor on the VGA port

