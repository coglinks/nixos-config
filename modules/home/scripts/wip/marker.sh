#!/usr/bin/env bash

pdf=$1
no_of_pages=$2

split=1
start_number=0
end_number=5

# Number pattern
# 0 - 5
# 6 - 10
# 11 - 15
# 16 - 20

out="../my-notes/convert/$pdf/split-$split"

while [ $end_number -le "$no_of_pages" ]; do
  # echo "$start_number - $end_number"
  cat <<EOF

    mkdir -p $out

    marker_single \
      $pdf \
      --page_range "$start_number-$end_number" \
      --paginate_output \
      --output_format markdown \
      --output_dir $out
EOF

  ((split++))
  ((start_number = end_number + 1))
  ((end_number += 5))
done
