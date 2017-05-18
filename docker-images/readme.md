# Docker utility images

## About
All the images at the list might be usefull in development. Here are some workflow stategies where one or another image may be used (should be mentioned that we may use Windows ¯\\\_(ツ)\_/¯ during development):

1. [Run everything on Windows](#scenarioone) under Vagrant+Virtualbox;
2. Develop and test on Windows; bundle and ship with Docker;
3. Run everything on Windows; ship with Docker;

## Scenario 1<a id="#scenarioone"></a>
In that case we have to run application inside web-server + node image with application codebase mounted to the image. I't quite heavy on slow environment and symlinks still don\'t work, filename limit from Windows is still in place...

At least we tried. No future.

# TOC
- [Docker image for app development](./app-develop/readme.md)
- [Docker image for app deploy](./app-release/readme.md)
- [nginx-proxy](./nginx-proxy/readme.md)