ARG NODEVER[=7.8]
FROM node:${NODEVER}

WORKDIR /usr/share/nginx/html

ARG SOURCEPATH[=./]
COPY ${SOURCEPATH} ./

LABEL node_version=${NODEVER}

ARG NODEENV[=production]
ENV NODE_ENV ${NODEENV}

RUN apt-get update && apt-get install -y git make g++ build-essential libssl-dev python curl

RUN npm i -g cross-env babel-cli

RUN npm i && npm run prepare

EXPOSE 1377

CMD npm start
