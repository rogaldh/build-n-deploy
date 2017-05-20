# reverse-proxy

Reverse-proxy with https support

## Prerequisites
- Waits for an upstream by `app` link on `1377` port

## Build it
```
# Build
$ sudo docker build \
    -t SERVER_IMAGE_NAME \
    .
```

## Use it
```
$ docker run \
  --name RUNNING_IMAGE_NAME \
  -d APP_IMAGE_NAME

$ docker run \
  --link RUNNING_IMAGE_NAME:app \
  -d PROXY_IMAGE_NAME
```
