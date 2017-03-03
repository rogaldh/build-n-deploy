FROM node-app

RUN rm -v /etc/nginx/conf.d/default.conf

COPY ./conf.d /etc/nginx/conf.d/

# Append "daemon off;" to the configuration file
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html

# Expose ports
EXPOSE 80

# Set the default command to execute when creating a new container
CMD service nginx start
