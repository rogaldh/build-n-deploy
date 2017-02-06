# Docker usage
Here are some examples of Docker & Vagrant usage on Windows. 

### Run Docker image on Vagrant with dir & port forwarding
```
# run apache container at Vagrant box
$ sudo docker run -d -i -t \
	-p BOX_PRIVATE_IP:8080:80 -p BOX_PRIVATE_IP:30022:22 \
	-v /www:/var/www \
	DOCKER_USERNAME/apache /usr/sbin/apache2ctl -D FOREGROUND
```

### Run Docker image on Vagrant (nginx)
```
$ sudo docker run -d -i -t \
    -p IP_ADDRESS:8080:80 -p IP_ADDRESS:30022:22 -p IP_ADDRESS:1377:1377 \
    -v EXTERNAL_DIR_TO_MOUNT:LOCAL_DIR_WHERE_SHOULD_MOUNT DOCKER_USERNAME/IMAGE_NAME \  /usr/sbin/nginx -g 'daemon off;'
```

### Connect to running docker image 
```
# `4daa67818979` — running container id
sudo docker exec -i -t 4daa67818979 /bin/bash
```

### [Run Docker with Vagrant on Windows](https://github.com/npm/npm/issues/9901#issuecomment-146585579)
There is an issue about npm install. Vagrant on Windows doesn\'t support symlinks. So we can use [`--no-bin-links`](https://docs.npmjs.com/misc/config#bin-links) flag for it.

### Load/save Docker images w/o hub
```
$ sudo docker save -o SAVE_IMAGE_TO_PATH IMAGE_NAME
$ sudo docker load -i PATH_TO_IMAGE
```