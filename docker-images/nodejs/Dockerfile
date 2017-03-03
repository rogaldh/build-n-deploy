FROM nginx

ARG VERSIONNAME
ARG ARCHVALUE

COPY ./node-install.sh /root/

RUN ~/node-install.sh ${VERSIONNAME} ${ARCHVALUE}
