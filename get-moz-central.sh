#!/bin/bash

BASE=$PWD

git clone https://github.com/mozilla-b2g/B2G.git
cd B2G
./config.sh galaxy-s2
echo GECKO_PATH=$BASE/mc >> .userconfig 
cd ..

hg clone http://hg.mozilla.org/mozilla-central/ mc