# Server setup

## Adding SSH to keychain

**Windows**

1. Search for `services` on windows.
2. Find `OpenSSH Authentication Agent` in the list.
3. Select properties and change start method to `automatic`
4. Hit `apply` then press `start` and `ok`.

**Commands (Powershell)**

1. `ssh-add *PATH*` Enter path to key. Usually in `C:/Users/*USER*/.ssh/`
2. `ssh-add -l` To check if key has been added.

## Setting up server

**Commands**
`df -h` Lists filesystem usage.

**Connect to machine**

- `ssh ubuntu@194.47.177.33`
- If no keychain `ssh ubuntu@194.47.177.33 -i C:/Users/samme/.ssh/ss225ze_key_ssh.pem`

**Update software**

1. `sudo apt update` get newest packages.
2. `sudo apt upgrade` update to newest packages.
3. `sudo apt dist-upgrade` update OS/Distribution.

**Restart machine after update**
`sudo shutdown -r now` (This will perform a system shutdown in a proper way and then reboot the computer).
`sudo reboot`

## Node.js

Head over to **[nodejs-downloads](https://nodejs.org/en/download/)** scroll down and select "_Installing Node.js via package manager_". Select Ubuntu and follow the instructions that are given.

Check if installation was successful by using the commands.

- `node -v`
- `npm -v`

## NGINX

**Commands**

- `sudo apt-get install nginx`
- `sudo systemctl status nginx`
- `sudo systemctl reload nginx`

**Useful paths**

- `/etc/nginx/nginx.conf` Location of global config file.
- `/etc/nginx/sites-enabled/default` Location of default server block config file.

**Remove server leaks for production**

1. `sudo nano /etc/nginx/nginx.conf`
2. Remove the comment sign (`#`) before `server_tokens off;`
3. Restart nginx `sudo systemctl restart nginx.service`

**Editing config file of server**
`sudo nano /etc/nginx/conf.d/cscloud7-33.lnu.se.conf`

## Docker

**Commands**
`sudo docker system prune -a --volumes`
Removes:

- all stopped containers.
- all networks not used by at least one container.
- all volumes not used by at least one container.
- all images without at least one container associated to them.
- all build cache.

**Steps**

1. Follow guide to install the latest version: **[docker-install-ubuntu](https://docs.docker.com/engine/install/ubuntu/)** install using repository x86_64 / amd64.

2. Add group docker to user ubuntu
   `sudo usermod -aG docker ubuntu`
   `sudo systemctl restart docker`
   `exit` and enter server again.

Docker is now accessible from the server or local terminal (check for newer version).

3. Server
   `docker pull mongo:latest`
   `docker run -d -p 27017:27017 --name mongodb mongo:latest`
   Run docker on different port
   `docker run -d -p 27018:27017 --name mongodb mongo:latest`
   Locally
   `docker -H ssh://ubuntu@194.47.177.33 run -d -p 27017:27017 --name mongodb mongo:latest`

## PM2

**Commands**

- `sudo npm i pm2 -g` Installation (global).
- `pm2 logs --lines 200` Shows log with 200 rows.
- `pm2 monit` Monitoring view.
- `pm2 env :id` Look up all enviroment variables for the specified pm2 instance.
- `:env_var="" pm2 restart :id --update-env` Update a specific enviroment variable for the specified pm2 instance.

**Start application**

1. Move to application location on server, example: `/var/www/webapp`.
2. Install production dependencies `npm i --omit=dev`.
3. Choose cmd string to run PM2

- `PORT=5001 NODE_ENV=production pm2 start npm --name webapp:5001 -- start`

or with enviroment variables (update values where needed).

- `PORT=5001 DB_CONNECTION_STRING=mongodb://localhost:27017/mongodb BASE_URL=/ SESSION_NAME=1aobys73 SESSION_SECRET=0dns7b2a NODE_ENV=production pm2 start npm --name webapp:5001 -- start`

## Template

Pay attention to the `/` at row 1 and 2.

```nginx
server {
  listen 80;
  listen [::]:80;

  # used to serve static files
  index index.html;

  root /var/www/html;

  location / {
    try_files $uri $uri/ =404;
  }
}
```

Serve static home page in directory `/var/www/home` with starting point `index.html`.

```nginx
server {
  listen 80;
  listen [::]:80;

  server_name cscloud7-33.lnu.se;
  index index.html;

  root /var/www/home;

  location / {
    try_files $uri $uri/ =404;
  }

  location /webapp/ {
    proxy_pass http://localhost:5001/;
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
}
```

Serve application as home page (NOTE: location).

```nginx
server {
  listen 80;
  listen [::]:80;

  server_name cscloud7-33.lnu.se;
  # index index.html;

  # root /var/www/html;

  # location / {
  #   try_files $uri $uri/ =404;
  # }

  location / {
    proxy_pass http://localhost:5001/;
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
}
```

## Transfering files using SSH

> Make sure that the owner of the folder is the server (ubuntu) and not root!
> **Path** > `/var/www` place folder here

**Commands**
Change owner of folder
`sudo chown ubuntu webapp/`

**FileZilla**

1. Click on `hosts` top left corner.
2. Create a new site and select protocol `SFTP - SSH File Transfer Protocol`
3. Enter the IPv4 adress of the server.
4. Change `Logon Type` to interactive and change `User` to `ubuntu`.
   - If interactive does not work then change `Logon Type` to `Key file` and locate the SSH file on your local computer.

## Links

HTTPS Certificate at **[letsencrypt.org](https://letsencrypt.org/)**
