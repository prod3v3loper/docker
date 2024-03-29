# PHP 8 development environment 

With **Apache**, **PHP**, **MySQL** & **PhpMyAdmin**

| localhost | phpmyadmin |
| --- | --- |
| <img src="img/localhost.png" width="424"> | <img src="img/phpmyadmin.png" width="300"> |
| http://localhost:8002 | http://localhost:8003 |

> You need to have Docker installed on your server to proceed using this PHP environment.

> Donwload Docker: https://www.docker.com/

The following four separate service containers will be used:

- `php` service running PHP 8. (Created from Dockerfile)

- `apache` service running Apache2. (Created from Dockerfile)

- `db` service running MySQL. (Created from Image)

- `phpmyadmin` service running PhpMyAdmin. (Created from Image)

# Setting up

Get the project per `git` or donwload it from github https://github.com/prod3v3loper/docker/releases.

```bash
$ git clone https://github.com/prod3v3loper/docker.git
```

Set the MySQL environment variables creating a `.env` file with:

```js
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=database
DB_USERNAME=user
DB_PASSWORD=pass
```

# Running the environment

When the build is finished, you can run the environment in background mode with:
```bash
docker-compose up -d
```

Now go to your browser and access your server’s domain name or IP address on port 8002. 

In case you are running this demo on your local machine, use http://localhost:8002 to access the application from your browser. 

PhpMyAdmin can access via: http://localhost:8003, is defined in `docker-compose.yml`

To show information about the state of your active services, run:
```bash
docker-compose ps
```

If the container is running but not showing up with just docker ps, extend it with the -a parameter:
```bash
docker-compose ps -a
```

You can use the docker-compose exec command to execute commands in the service containers, such as an ls -l to show detailed information about files in the application directory:
```bash
docker-compose exec <CONTAINER-ID> ls -l
```

Or go direct in the container per bash:
```bash
docker exec -it <CONTAINER-ID> bash
```

If you not in a bash environment, get bash in this project and run:
```bash
docker exec -it <CONTAINER-ID> /bin/bash
```

Start with when mysql or other not running to log the states
```bash
docker-compose up
```

Rebuild to recreate the images and settings
```bash
docker-compose up -d --no-deps --build
```

Copy files from container
```bash
docker cp <CONTAINER-ID>:/usr/local/etc/php php
```

To shut down your Docker Compose environment and remove all of its containers, networks, and volumes, run:
```bash
docker-compose down
```

Build the app image to upload in dockerhub:
```bash
docker-compose build <CONTAINER-ID>
```