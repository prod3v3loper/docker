# PHP 8 development environment 

With **Apache**, **PHP**, **MySQL** & **PhpMyAdmin**

> You need to have Docker installed on your server to proceed using this PHP environment.

The following three separate service containers will be used:

An `php` service running PHP 8.
A `apache` running Apache2.
A `db` service running MySQL.

PHP code before serving the application to the final user.

# Running the environment

Set the MySQL environment variables creating a `.env` file based on the `.env` file.

```js
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=database
DB_USERNAME=user
DB_PASSWORD=pass
```

Build the app image with the following command:
```bash
docker-compose build app
```

When the build is finished, you can run the environment in background mode with:
```bash
docker-compose up -d
```

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
docker-compose exec app ls -l
```
```bash
docker exec -it <CONTAINER-ID> /bin/bash
```
Now go to your browser and access your server’s domain name or IP address on port 8000. 
In case you are running this demo on your local machine, use http://localhost:8000 to access the application from your browser.

You can use the logs command to check the logs generated by your services:
```bash
docker-compose logs nginx
```

If you want to pause your Docker Compose environment while keeping the state of all its services, run:
```bash
docker-compose pause
```

You can then resume your services with:
```bash
docker-compose unpause
```

To shut down your Docker Compose environment and remove all of its containers, networks, and volumes, run:
```bash
docker-compose down
```

Start with when mysql or other not running
```bash
docker-compose up
```

Rebuild
```bash
docker-compose up -d --no-deps --build
```