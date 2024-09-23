#! /bin/bash

set -e

EXAMPLES=*

for ex in $EXAMPLES
do
    [ -d $ex ] || continue

    echo "===== $ex ====="

    cd $ex
    dub run
    cd ..

done