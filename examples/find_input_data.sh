#! /bin/bash

set -e

EXAMPLES=*
INPUT_DATA=$(find ../data -name '*.hdf5' -o -name '*.h5')

for ex in $EXAMPLES
do
    [ -d $ex ] || continue

    USED=""
    for i in $INPUT_DATA
    do
        f=$(basename $i)
        if grep -q $f $ex/source/*.d 2>/dev/null
        then
            USED="$USED \"$f\","
        fi
    done
    # auto aa = [21u: "he", 38: "ho", 2: "hi"];
    echo "\"$ex\" : [ $USED ],"
done