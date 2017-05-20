#!/bin/bash

read -p "Enter path to dir which contains files for build (./): " PATHTOFILES
read -p "Enter Docker image name to build (tarball): " IMAGENAME
read -p "Enter Node.js version (7.8): " NODEVER

: PATHTOFILES = ${PATHTOFILES:='./'}
: IMAGENAME = ${IMAGENAME:='tarball'}
: NODEVER = ${NODEVER:='7.8'}

[ $PATHTOFILES == './' ] && PATHTOCOPY='../' || PATHTOCOPY='../../'

# inject .gitignore
! test -f "${PATHTOFILES}.dockerignore" && cp .dockerignore $PATHTOFILES && echo ".dockerignore was created"

# tar fallback
if ! [ -x "$(command -v tar)" ]; then
  echo "Let's install tar"
  sudo apt-get update && apt-get install -y tar
fi

# Archive node_modules
if ! [ $(find $PATHTOFILES -type f -name 'node_modules*') ]; then
  echo "Let's pack modules"
  
  cd $PATHTOFILES/node_modules
  tar -cvf ../node_modules.tar *
  cd $PATHTOCOPY

  echo 'node_modules were packed'
fi

echo "Build initiated. Image: $IMAGENAME powered by node:$NODEVER"
docker build \
 --build-arg SOURCEPATH=$PATHTOFILES \
 --build-arg NODEVER=$NODEVER \
 -t $IMAGENAME \
 .
