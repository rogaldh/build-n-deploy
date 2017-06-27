g --name im_production  -d instrummart:7.9.0

#!/bin/bash

read -p "Which application-image should be runned (appimage): " IMAGE
read -p "Which name should aplication use (app): " NAME

: IMAGE = ${IMAGE:='appimage'}
: NAME = ${NAME:='app'}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# get abs path to the script

docker ps --filter "status=exited" | cut -d ' ' -f 1 | xargs sudo docker rm
docker run \
  -v ${DIR}/../config/:/usr/share/nginx/html/config \
  --name $NAME \
  -d $IMAGE
