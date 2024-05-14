# Server setup

## Linux

### Commands

- `sudo chown {user} directory/` Changes the owner of the directory.

## Adding SSH to keychain

### Windows

1. Search for `services` on windows.
2. Find `OpenSSH Authentication Agent` in the list.
3. Select properties and change start method to `automatic`
4. Hit `apply` then press `start` and `ok`.

### Commands (powershell)

1. `ssh-add *PATH*` Enter path to key. Usually in `C:/Users/*USER*/.ssh/`
2. `ssh-add -l` To check if key has been added.

## Setting up server

### Commands

`df -h` Lists filesystem usage.

### Connect

- `ssh ubuntu@ip-address` (ip-address is the IPv4 address of the server).
- If no keychain `ssh ubuntu@ip-address -i location-to-key.pem`

### Update

1. `sudo apt update` get newest packages.
2. `sudo apt upgrade` update to the newest packages.
3. `sudo apt dist-upgrade` update OS/Distribution.

### Restart

- `sudo shutdown -r now` (This will perform a system shutdown in a proper way and then reboot the computer).
- `sudo reboot`

## Node.js

Head over to **[nodejs-downloads](https://nodejs.org/en/download/)** scroll down and select "_Installing Node.js via package manager_". Select Ubuntu and follow the instructions that are given.

Distributions for Ubunty and Debian can be found here: **[nodesource-distributions](https://github.com/nodesource/distributions)** (suggest using a bash terminal that allows the script to be entered properly). The script command should install both node and npm.

Check if installation was successful by using the commands.

- `node -v`
- `npm -v`

## NGINX

IMPORTANT! Only edit the `sites-available` or `sites-enabled` default file. Set the new application location outside the `default` block found inside the file.

### Commands

- `sudo apt-get install nginx`
- `sudo systemctl status nginx`
- `sudo systemctl reload nginx`

### Useful paths

- `/etc/nginx/nginx.conf` Location of global config file.
- `/etc/nginx/sites-enabled/default` Location of default server block config file.
- `/etc/nginx/conf.d/server-name.conf` Location of possible server block config file.

### Remove server leaks

1. `sudo nano /etc/nginx/nginx.conf`
2. Remove the comment sign (`#`) before `server_tokens off;`
3. Restart nginx `sudo systemctl restart nginx.service`

### Server blocks

**IMPORTANT** -- Only edit under the server `{}`-block, read the comments found in the `default`-file! Pay attention to the `/` at the end of the `location`-block.

```conf
server {
  # Pre-added blocks may exist... do not remove these!

	root /var/www/html;

  # Pre-added blocks may exist... do not remove these!

	# for client-side applications multiple locations can be added here:
	# Example use /app (notice there is no "/" at the end).
	# Make sure the files are correctly placed under "/var/www/html"!
	location / {
		  # First attempt to serve request as file, then
		  # as directory, then fall back to displaying a 404.
		  try_files $uri $uri/ =404;
	}

	location / {
		proxy_pass http://localhost:5000/;
		proxy_http_version 1.1;
		proxy_set_header Upgrade            $http_upgrade;
		proxy_set_header Connection         'upgrade';
		proxy_set_header Host               $host;
		proxy_set_header X-Real-IP          $remote_addr;
		proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto  $scheme;
		proxy_set_header X-Forwarded-Host   $host;
		proxy_set_header X-Forwarded-Port   $server_port;
	}

  # More server blocks can be added here
  # Pre-added blocks may exist... do not remove these!
}
```

## Docker

### Commands

- `sudo docker ps` lists all running containers. Add `-all` to list all containers.
- `sudo docker system prune -a --volumes` removes all:
  - stopped containers.
  - networks not used by at least one container.
  - volumes not used by at least one container.
  - images without at least one container associated to them.
  - build cache.

### Basics

1. Follow guide to install the latest version: **[docker-install-ubuntu](https://docs.docker.com/engine/install/ubuntu/)** install using repository x86_64 / amd64.

Docker is now accessible from the server or local terminal (check for newer version). `sudo` may be required to use docker commands.

2. Server
   1. `docker pull mongo:latest`
   2. `docker run -d -p 27017:27017 --name mongo mongo:latest`
   3. **Alt**: run docker on different port: `docker run -d -p 27018:27017 --name mongo mongo:latest`

### Networks

Create a docker network:

```shell
docker network create {name}
```

Run the mongo container:

```shell
docker run --network={name} -d -p 27017:27017 --name mongo mongo:latest
```

**IMPORTANT** -- Update any `.env`-files to adhere with the container's name: `mongodb://mongo:27017`. Normally outside a docker network this may be `mongodb://localhost:27017`.

Run the api container:

```shell
docker run --network=apinet -d -p 5000:80 --name api api:latest
```

### Docker images and distributing

Building the image:

```shell
docker build -t {name} .
```

Saving the image to a `.tar` file:

```shell
docker save -o C:\Users\user\{name}.tar {image}
```

Loading the image machine:

```shell
docker load -i C:\Users\user\{name}.tar
```

## Scripts

**IMPORTANT** -- Make sure that all environment variables are set!

Run script during an active _Docker_ container instance:

```shell
# python keyword may differ here:
docker exec -it {container} python script.py
```

## PM2

### Commands

- `sudo npm i pm2 -g` Installation (global).
- `pm2 monit` Monitoring view.
- `pm2 logs --lines 200` Shows log with 200 rows.
- [PM2-env-variable-cmd](https://pm2.io/docs/runtime/best-practices/environment-variables/)

### Start app

1. **IMPORTANT** -- Move to app root: `/var/www/app`.
2. Install production dependencies (if node) `npm i --omit=dev`.
3. Choose cmd string to run PM2:

- Example: `PORT=5001 NODE_ENV=production pm2 start npm --name app -- start`

## Useful links

[TLS certificate (letsencrypt)](https://letsencrypt.org/)
