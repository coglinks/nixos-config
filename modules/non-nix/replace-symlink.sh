#!/usr/bin/env bash

for link in $(find ./* -type l)
do
  loc="$(dirname "$link")"
  dir="$(readlink "$link")"
  rm "$link"
  cp "$dir" "$loc"
  sudo chown --reference="$HOME" -R "$link"
  sudo chmod --reference="$HOME" -R "$link"
done
