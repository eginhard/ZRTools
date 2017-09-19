#!/bin/bash

EXPDIR=$1
L=$2
SUFFIX=$3

python ~/zero/bucktsong_segmentalist/features/wordpairs/strip_duplicate_terms.py \
    $EXPDIR/results/master_graph.pairs \
    $EXPDIR/results/master_graph.pairs2

python ~/zero/code/word_pairs/count_same_speaker_pairs.py \
    $EXPDIR/results/master_graph.pairs2

python ~/zero/bucktsong_segmentalist/features/wordpairs/get_terms_from_pairs.py \
    $EXPDIR/results/master_graph.pairs2 \
    $EXPDIR/results/master_graph.terms

python ~/zero/bucktsong_segmentalist/features/wordpairs/get_segments_from_npz.py \
    /disk/scratch/s1680167/zero/data/word_pairs/$L/mfcc.train.npz \
    $EXPDIR/results/master_graph.terms \
    /disk/scratch/s1680167/zero/data/word_pairs/$L/segments$SUFFIX.train.npz 

echo "Now run:"
echo "python ~/zero/code/word_pairs/create_pair_file_same.py $EXPDIR/results/master_graph.terms /disk/scratch/s1680167/zero/data/word_pairs/$L/pairs_sw$SUFFIX.train"
echo "python ~/zero/code/word_pairs/count_same_speaker_pairs.py /disk/scratch/s1680167/zero/data/word_pairs/$L/pairs_sw$SUFFIX.train"
echo "~/zero/code/word_pairs/align_pairs.sh $L $SUFFIX"
