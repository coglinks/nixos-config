#!/usr/bin/env bash

# Note this is the ai generated version of ./marker.sh

pdf=$1
no_of_pages=$2

split=1
start_number=1
end_number=5

while [ $start_number -le "$no_of_pages" ]; do
  out="../my-notes/convert/$pdf/split-$split"
  mkdir -p "$out"

  # Adjust end_number if it exceeds total pages
  if [ $end_number -gt "$no_of_pages" ]; then
    end_number=$no_of_pages
  fi

  echo "Processing pages $start_number-$end_number -> $out"

  marker_single \
    "$pdf" \
    --page_range "$start_number-$end_number" \
    --paginate_output \
    --output_format markdown \
    --output_dir "$out"

  ((split++))
  ((start_number = end_number + 1))
  ((end_number += 5))
done
