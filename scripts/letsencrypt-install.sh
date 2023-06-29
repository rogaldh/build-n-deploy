#!/bin/sh -e
# https://certbot.eff.org/#ubuntutrusty-nginx

apt-get install -y software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install -y certbot

echo "Woop! Let's Encrypt is installed. Run: 'certbot certonly --standalone DOMAIN_NAME,S' to generate a cert"
