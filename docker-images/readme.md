# Docker utility images

## About
All the images at the list might be usefull in development. Here are some workflow stategies where one or another image may be used (should be mentioned that we may use Windows ¯\\\_(ツ)\_/¯ during development):

1. [Run everything on Windows](#scenarioone) under Vagrant+Virtualbox;
2. [Develop and test on Windows](#scenariotwo); bundle and ship with Docker;
3. Run everything on Windows; ship with Docker;

## Scenario 1<a id="#scenarioone"></a>
In that case we have to run application inside web-server + node image with application codebase mounted to the image. I't quite heavy on slow environment and symlinks still don\'t work, filename limit from Windows is still in place... The only pros is that we might not have node available at the system.

At least we tried. No future.

## Scenario 2<a id="scenariotwo"></a>
Application is running on local machine. All the tests are runned there also. Sounds ok. Application bundling is quite tricky. 

First of all we assume that application works behind reverse-proxy. In that case it can handle static files from the bundle and might be reused. `Dockerfile` should contain instructions for bundling out our app. Configuration takes time (depends on application complexity).

> There might be an issue. Docker `build` fails occasionally on large npm bundles during `npm i`. But we still can tar/untar modules (from npm-cache or node_modules dir. weird).

If image is bundled shipping works like a charm.

# TOC
- [Docker image for app development](./app-develop/readme.md)
- [Docker image for app deploy](./app-release/readme.md)
- [nginx-proxy](./nginx-proxy/readme.md)