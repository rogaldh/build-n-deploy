#!/bin/sh -e

groupadd -f docker

usermod -aG docker $USER
