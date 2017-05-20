ARG NODEVER
FROM node:${NODEVER}

WORKDIR /usr/share/nginx/html

ARG SOURCEPATH
COPY ${SOURCEPATH} ./

RUN apt-get update && apt-get install -y git make g++ build-essential libssl-dev python curl

# `RUN npm i` fails on massive number of packages.
# That's why we copy already installed packages and unpack them. Weird
RUN cd /usr/share/nginx/html && mkdir -p node_modules
RUN tar -xf ./node_modules.tar -C node_modules && echo "Extracted node_modules.tar archive to node_modules"
RUN rm ./node_modules.tar && echo "node_modules.tar archive deleted"

# ENV PATH=$PATH:/root/.node/bin
RUN npm i -g cross-env webpack babel-cli

RUN npm prune && npm install

RUN npm run prepare

EXPOSE 1377

CMD npm start
