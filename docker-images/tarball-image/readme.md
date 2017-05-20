# tarball-image

Suited for applications should be fully bundled inside a container.

## Notes
- [`Dockerfile`](./Dockerfile#L10) contains kinda hack around `npm i`

## How to
Builder works ourside the application directory. That's why there is no need to store Dockerfile inside the app. The only thing to care about is a version of nodejs.
```
# Copy stuff to the directory which contains folder with an application
$ cp ./* PATH_TO_THE_APP_PARENT_DIRECTORY
$ sudo ./build.sh
```
