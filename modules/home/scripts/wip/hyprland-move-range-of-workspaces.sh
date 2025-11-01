#!/usr/bin/env bash

# here one example how to use it
# ./hyprland-monitor-toggle.sh 6 7 DP-2
# To move a range of workspaces (e.g., 2 to 5) to a external monitor, you can use a script to automate the dispatch commands.

# Define the range of workspaces and target monitor
START=$1
END=$2
MONITOR=$3

# Loop through the range and move each workspace
for WORKSPACE in $(seq $START $END); do
  hyprctl dispatch moveworkspacetomonitor $WORKSPACE $MONITOR
done
