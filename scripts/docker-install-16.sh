#!/bin/bash -e
apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

if [[ ! $(apt-key fingerprint 0EBFCD88) ]]; then echo "Wrong fingerprint" >&2; exit 2; fi

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install -y docker-ce

echo "Docker CE was installed:"

docker version

