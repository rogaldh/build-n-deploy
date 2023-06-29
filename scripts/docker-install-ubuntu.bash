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

# Verify that APT is pulling from the right repository.
apt-cache policy docker-engine

apt-get install -y docker-ce

docker version

echo "Run to verify: 'docker run hello-world'"
