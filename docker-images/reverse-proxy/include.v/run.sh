#!/bin/bash

read -p "Which image should be runned (reverse-proxy): " PROXY
read -p "Which image should be linked (app): " UPSTREAM

: PROXY = ${PROXY:='reverse-proxy'}
: UPSTREAM = ${UPSTREAM:='app'}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# get abs path to the script

docker run -p 80:80 -p 443:443 \
  -v ${DIR}/letsencrypt:/etc/nginx/letsencrypt \
  -v ${DIR}/default:/etc/nginx/conf.d/default \
  -v ${DIR}/ssl:/etc/nginx/conf.d/ssl \
  --link $UPSTREAM:app \
  -d $PROXY
