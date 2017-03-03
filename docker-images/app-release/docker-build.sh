#!/bin/bash

read -p "Enter path to dir which contains files for build: " PATHTOFILES
read -p "Enter Docker image name to build: " IMAGENAME

# This was used for .dockerignore inside app dir
# cp $PATHTOFILES/.dockerignore ./

if ! [ -x "$(command -v tar)" ]; then
    sudo apt-get update && apt-get install -y tar
fi

# Archive node_modules
cd $PATHTOFILES/node_modules
tar -cvf ../node_modules.tar *
cd ../../

sudo docker build \
    --build-arg SOURCEPATH=$PATHTOFILES \
    -t $IMAGENAME \
    .
