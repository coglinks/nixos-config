#!/usr/bin/env bash

filename="$1"
[ -z "$filename" ] && {
  echo "No file provided"
  exit 1
}

# Let the user pick a GUI app using Rofi drun
app=$(rofi -show drun -run-command '{cmd} "'"$filename"'"' -modi drun -p "Open with:")

# Exit if nothing chosen
[ -z "$app" ] && exit 0
