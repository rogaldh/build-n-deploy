# app-develop-image

Contains Nginx server. Application should be injected via `-v`. Suited for development.

## Prerequisites
Built on top of [`nodejs`](../nodejs/readme.md#L=14) docker image.

## How to run

```
# Build
$ sudo docker build \
    -t IMAGE_NAME \
    .

# Run
$ sudo docker run -d \
    -v EXTERNAL_DIR:/usr/share/nginx/html \
    -p EXTERNAL_IP:EXTERNAL_PORT:80 \
    IMAGE_NAME
```
## Notes
[2-nd](../../doc/docker-usage.md#tips-and-tricks) tip is related to this image at some point.