#!/bin/bash

BASE=$PWD/bug${1}
ADRENO=$HOME/w/adreno200
ANDR_FS=$HOME/w/otoro-ics-0727

## Print information
echo "--"
echo " Create environment for bug $1"
echo " Base folder: $BASE"
echo " Mozilla code base: inbound"
echo " Configure: Otoro"
echo " Adreno code: $ADRENO"
echo " Android filesystem: $ANDR_FS"
echo "--"

## Build bug folder
mkdir $BASE
if [ $? -ne 0 ]; then
    echo "Fail to create bug folder: $BASE"
    exit 1;
fi

## Build B2G folder
cd $BASE
git clone https://github.com/mozilla-b2g/B2G.git
cd B2G
cp $ADRENO/Adreno200-AU_LINUX_ANDROID_ICS_CHOCO_CS.04.00.03.06.001.zip ./
ANDROIDFS_DIR=$ANDR_FS ./config.sh otoro
echo GECKO_PATH=$BASE/ib >> .userconfig 

## Get source code from mozill inbound
cd $BASE
hg clone http://hg.mozilla.org/integration/mozilla-inbound/ ib
