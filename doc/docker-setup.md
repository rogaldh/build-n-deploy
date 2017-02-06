# Docker setup

This guide describes pure docker installation on `ubuntu/trusty64` Vagrant's box

## Prerequisites
- 64-bit Linux distributive
- 3.10+ kernel version

## How to
```
# Update package information, ensure that APT works with the https method, and that CA certificates are installed.
$ sudo apt-get-update
$ sudo apt-get install apt-transport-https ca-certificates

# Add the new GPG key.
$ sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Run the following command, substituting the entry for your operating system for the placeholder
$ echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list

# Update the APT package index.
$ sudo apt-get update

# Verify that APT is pulling from the right repository.
$ apt-cache policy docker-engine

# Install the recommended packages according to a kernel version.
$ sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

# Install Docker
$ sudo apt-get install docker-engine

# Start the docker daemon.
$ sudo service docker start

# Create the docker group
$ sudo groupadd docker

# Add your user to docker group.
$ sudo usermod -aG docker $USER

# Verify if docker is installed correctly.
$ sudo docker run hello-world
```
> At 4th command we use box-specific repository name. For other Linux distributives it varies

## Links
- [Install Docker on Ubuntu](https://docs.docker.com/engine/installation/linux/ubuntulinux/)
- [Install Docker latest version](https://docs.docker.com/engine/installation/linux/ubuntulinux/#install-the-latest-version)