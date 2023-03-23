#!/bin/bash

# Get battery level
battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Check if battery level is below 20%
if [ $battery_level -le 20 ]; then
    dunstify "Battery level is ${battery_level}% - please plug in your charger"
fi

# Check if battery level is above 82%
if [ $battery_level -ge 82 ]; then
    dunstify "Battery level is ${battery_level}% - please unplug your charger"
fi
