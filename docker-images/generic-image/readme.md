# generic-image

Suited for applications should be partially bundled for production during containerization process.

## Prerequisites
- Bundled public assets.

## Build it
Works inside the application directory.
```
# Copy stuff to the application directory
$ cp ./* PATH_TO_THE_APP_DIRECTORY

#
$ docker build \
```

## Use it
Assume that image should be linked to the another contaner:
```
$ sudo docker run \
  --name RUNNING_IMAGE_NAME \
  -d APP_IMAGE_NAME

$sudo docker run \
  --link RUNNING_IMAGE_NAME:LINK_NAME \
  -d PROXY_IMAGE_NAME
```

## Links
- [reverse-proxy](../reverse-proxy)

