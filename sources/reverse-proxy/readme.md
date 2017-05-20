# reverse-proxy

Reverse-proxy with https support.

## Prerequisites
- Waits for an upstream by `app` link on `1377` port;
- Assume that Let's Encrypt has been installed and certs are generated outside container.

## Build it
```
# Build
$ sudo docker build \
  --build-arg FROM=nginx:alpine
  -t SERVER_IMAGE_NAME \
  .
```

## Use it
```
# run application image
$ docker run \
  -p EXTERNAL_PORT:INTERNAL_PORT \
  -v absolute/path/to/secret/config/:/usr/share/nginx/html/config \
  --name RUNNING_IMAGE_NAME \
  -d APP_IMAGE_NAME

# copy configuration files to the folder they should be managed from
$ cp -r ./include.v/* PATH_TO_SECRETS

# preparations
$ chmod +x ./build.sh && ./build.sh

$ chmod +x ./run.sh && ./run.sh
# run contains preconfigured `docker run`:
# $ docker run \
#   --link RUNNING_IMAGE_NAME:app \
#   -d PROXY_IMAGE_NAME
```

## Links
- [letsencrypt-install](../../scripts/letsencrypt-install.sh)
- [build](./include.v/build.sh)
- [run](./include.v/run.sh)

## Refs
- [Let's Encrypt](https://letsencrypt.org/)
- [Certbot](https://certbot.eff.org/)
- [SSL on Nginx](https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html)
- [Logjam (DH EXPORT)](https://blog.cloudflare.com/logjam-the-latest-tls-vulnerability-explained/)
