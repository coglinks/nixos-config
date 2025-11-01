#!/usr/bin/env bash

file="$1"

cp -L "$file" /tmp/
rm "$file"
mv "/tmp/$(basename "$file")" .

sudo chown --reference="$HOME" -R "$(basename "$file")"
sudo chmod --reference="$HOME" -R "$(basename "$file")"
