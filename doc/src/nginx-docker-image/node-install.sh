#!/bin/bash

apt-get update && apt-get install -y \
    curl;

cd /usr/local/bin;
curl -sL https://nodejs.org/dist/v7.6.0/node-v7.6.0-linux-x64.tar.xz > node.xz;

# if tar can\'t untar .xz
apt-get install -y xz-utils < "/dev/null";
tar -xJf node.xz && rm node.xz;
mv node-v7.6.0-linux-x64/ node;
cd /usr/bin;
ln -s /usr/local/bin/node/bin/node nodejs;
