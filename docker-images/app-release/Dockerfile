FROM node-app

WORKDIR /usr/share/nginx/html

ARG SOURCEPATH

# ENV PATH=$PATH:~/.node/bin
ENV PATH=$PATH:/root/.node/bin

COPY ${SOURCEPATH} ./

RUN apt-get update && apt-get install -y git

RUN npm i -g webpack babel-cli

# RUN npm i
# Building fails on massive number of packages.
# That's why we copy already installed packages and unpack them
# Weird
RUN cd /usr/share/nginx/html && mkdir node_modules
RUN tar -xf ./node_modules.tar -C node_modules && echo "Extracted node_modules.tar archive to node_modules"
RUN rm ./node_modules.tar && echo "node_modules.tar archive deleted"

RUN npm prune && npm install

EXPOSE 1377

CMD npm start
