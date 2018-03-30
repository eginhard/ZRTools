#!/bin/bash

# Prints the current and an estimate of the remaining run time of discovery.

EXP=$1

str="_"
if [[ "$EXP" == *"buckeye"* ]]; then
    str="s"
fi

done=$(grep $str $EXP/matches/out.* | wc -l)
total=$(wc -l $EXP/disc.cmd_* | tail -1 | grep -o -P "[0-9]+")

percent=$(bc -l <<< "scale=4; $done/$total")

start=$(date -r $EXP/matches +%s)
now=$(date +%s)

hours=$(bc -l <<< "scale=0; ($now-$start)/60/60")
minutes=$(bc -l <<< "scale=0; ($now-$start)/60 % 60")

finish_s=$(bc -l <<< "scale=0; $start + ($now-$start)/$percent")
finish=$(date -d "@${finish_s}")

echo "$done/$total ($percent) in ${hours}h ${minutes}m"
echo "Projected end: $finish"
