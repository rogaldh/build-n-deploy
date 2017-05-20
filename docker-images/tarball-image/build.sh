#!/bin/bash

read -p "Enter path to dir which contains files for build: " PATHTOFILES
read -p "Enter Docker image name to build: " IMAGENAME

PATHTOFILES = ${PATHTOFILES:=./}
IMAGENAME = ${IMAGENAME:='tarball'}

[ $PATHTOFILES == './' ] && PATHTOCOPY='../' || PATHTOCOPY='../../'

# inject .gitignore
cp .dockerignore $PATHTOFILES

# tar fallback
if ! [ -x "$(command -v tar)" ]; then
    sudo apt-get update && apt-get install -y tar
fi

# Archive node_modules
if ! [ $(find $PATHTOFILES -type f -name 'node_modules*') ]; then
    cd $PATHTOFILES/node_modules
    tar -cvf ../node_modules.tar *
    cd $PATHTOCOPY
fi

sudo docker build \
    --build-arg SOURCEPATH=$PATHTOFILES \
    -t $IMAGENAME \
    .
