#!/bin/sh
# Set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/arch.png
# Compositor
picom -b 
# Swap Escape and Caps Lock
setxkbmap -option caps:swapescape
# Screenshot program
flameshot &
# Notification daemon
dunst &
# Hotkey daemon
sxhkd &
# Input bus
ibus-daemon -d -x
# Custom scripts
sh -c ~/dotfiles/.scripts/cmus_daemon.sh &
# Polkit
lxqt-policykit-agent &

# DWM Status Bar
battery_info() {
    echo -n "Battery:$(acpi | cut -d, -f2)"
}

date_info() {
    echo -n "$(date +"%A %Y/%m/%d %H:%M")"
}

while true
do
    xsetroot -name "$(battery_info) | $(date_info)"
    sleep 5s
done
