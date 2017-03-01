# Nginx blank application server

## Prerequisites
* nginx/1.11.10

## How to
To deploy we have to do two things:
1. Copy all files from descendant directories to `/etc/nginx`. Nginx 1.11 has `default.conf` in it. That's why we can rename or delete it. Up to you;
2. If we run Docker image on Vagrant on Windows we should comment `sendfile on;` directive at `nginx.conf`.
