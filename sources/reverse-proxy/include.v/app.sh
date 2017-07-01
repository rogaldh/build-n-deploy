#!/bin/bash

read -p "Which application-image should be runned (appimage:tag): " IMAGE
read -p "Which name should aplication use (app): " NAME
read -p "Specify network name the application-image should be connected to (bridge): " NETWORK

: IMAGE = ${IMAGE:='appimage'}
: NAME = ${NAME:='app'}
: NETWORK = ${NETWORK:='bridge'}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# get abs path to the script

docker stop $NAME > /dev/null
# stop running image

docker ps --filter "status=exited" | cut -d ' ' -f 1 | xargs sudo docker rm > /dev/null
# remove image was stopped

docker run \
  -v ${DIR}/../config/:/usr/share/nginx/html/config \
  --name $NAME \
  -d $IMAGE
# run image by name

docker network connect $NETWORK $NAME
# connect image to the network
