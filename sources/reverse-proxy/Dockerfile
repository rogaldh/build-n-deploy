ARG FROM=nginx
FROM ${FROM}

WORKDIR /etc/nginx

#RUN rm -v conf.d/default.conf
COPY ./conf.d conf.d/

# Append "daemon off;" to the configuration file
# RUN echo "daemon off;" >> nginx.conf

# Expose ports
EXPOSE 80 443

# Set the default command to execute when creating a new container
CMD ["nginx", "-g", "daemon off;"]
