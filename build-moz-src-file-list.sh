#!/bin/bash

if [ "$1" == "" ]; then
    LIST=SRCFILE
else
    LIST=$1
fi

echo "Put all .c .cpp .idl .js .m .h .hpp files into list $LIST"

find . -type f \( \
    -name '*.c'-o \
    -name '*.cpp' -o \
    -name '*.idl' -o \
    -name '*.js' -o \
    -name '*.m' -o \
    -name '*.hpp' -o \
    -name '*.h' \
    \) > $LIST