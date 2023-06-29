#!/bin/sh -e

groupadd docker

usermod -aG docker $USER

