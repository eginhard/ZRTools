#!/bin/bash

L=$1
N_JOBS=$2
step=$3
SUFFIX=$4

NAME=gp-$L$SUFFIX

from=$(($step * $N_JOBS))
to=$(($step * $N_JOBS + $N_JOBS - 1))

. config

for n in $(seq $from $to); do
    n=`printf %03d $n`
    nice sh $EXPDIR/$NAME/disc.cmd_$n 1> $EXPDIR/$NAME/matches/out.$n 2> /dev/null &
done
