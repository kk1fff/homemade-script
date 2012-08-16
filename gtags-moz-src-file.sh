#!/bin/bash

GTAGS=`which gtags`
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GTAGSCONF=$SCRIPTDIR/gtags-moz-src-file-conf

if [ "$GTAGS" == "" ]; then
    echo "gtags not found"
    exit 1
fi

if [ "$1" == "" ]; then
    LIST=SRCFILE
else
    LIST=$1
fi

echo "indexing source code..."
export langmap="c:.c"
gtags --gtagsconf $GTAGSCONF --config