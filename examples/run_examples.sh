#! /bin/bash

set -e

EXAMPLES=*

for ex in $EXAMPLES
do
    [ -d $ex ] || continue

    cd $ex
    dub run
    cd ..

done