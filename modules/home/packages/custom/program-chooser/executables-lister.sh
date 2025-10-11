#!/usr/bin/env bash

temp_file=$(mktemp /tmp/exec_XXXXXX)

filtered_temp_file=$(mktemp /tmp/filtered_exec_XXXXXX)

ls --format=single-column /etc/profiles/per-user/"$(id -n -u)"/share/applications >"$temp_file"

sed 's/\.desktop$//' "$temp_file" >"$filtered_temp_file"

cat "$filtered_temp_file"

rm "$filtered_temp_file" "$temp_file"
