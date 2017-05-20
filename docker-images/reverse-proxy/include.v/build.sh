#!/bin/bash

read -p "Enter DH params length (2048): " DHLENGTH

: DHLENGTH = ${DHLENGTH:=2048}

ln -s /etc/letsencrypt letsencrypt
# link certs

mkdir -p ssl
openssl dhparam -out ./ssl/dhparam.pem $DHLENGTH
# generate DH params
