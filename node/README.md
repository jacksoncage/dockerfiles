Automated build of node.js with Docker
===========

 > Based on (Debian official repository)[https://index.docker.io/_/debian/]

### Startup environment variables
Docker will make of the following environment variables when starting `start.sh`. Default values are:

	EXECUTER node
	APP start

### Use the pre built image
The pre built image can be downloaded using docker directly. After that you do not need to use this command again, you will have the image on your machine.

	$ docker pull jacksoncage/node


### Build the docker image by yourself
If you prefer you can easily build the docker image by yourself. After this the image is ready for use on your machine and can be used for multiple starts.

	$ cd node-docker
	$ docker build -t jacksoncage/node .


### Start the container
The container has all pre requisites set up to run any node.js application.

	$ docker run -i -d -p 8080 -v `pwd`/www:/var/www:ro -v /etc/localtime:/etc/localtime jacksoncage/node

Can also be run with `nodemon` as `EXECUTER`

	$ docker run -i -d -p 8080 -e EXECUTER=nodemon -e APP=app.js -v `pwd`/www:/var/www:ro -v /etc/localtime:/etc/localtime jacksoncage/node

Give it a short coffee break before trying the browser on url http://localhost:8080.

#### Start the container and keep control
The command above starts the container in deamon mode (-d) and runs in the background. If you want to start it by yourself just to see what happens use this command:

	$ docker run -i -t -p 8080 -v `pwd`/www:/var/www:ro jacksoncage/node bash

Notice the two changes made here, first we replaced the deamon switch (-d) with the tty switch (-t) which pipes the std in and std out to your terminal.

You now end up as a root user in the docker container and can do simple things like ls, cd and more. More complex things can be achieved after a `apt-get install` of one or more software(s) of choice.

### Get the container ip and port
The first command inspects your created container and get the IPv4 address. Second command docker exported port for 8080.

    $ docker inspect <container_id> | grep IPAddress | cut -d '"' -f 4
    $ docker port <container_id> 8080 | cut -d ":" -f2

Now go to `<your container's ip>:<container's port>` in your browser


### Stop the container
Stopping a running container is possible via the docker api. If only one instance of this container is running this command will stop it:

	docker stop `docker ps |grep jacksoncage/node |cut -d\  -f1`
