# Server

## TLS

[TLS certificate (letsencrypt)](https://letsencrypt.org/)

## Adding SSH to keychain

### Windows

1. Run using `Win + R` using `services.msc`.
2. Find `OpenSSH Authentication Agent` in the list.
3. Goto `properties` and set start method to `automatic`.
4. Hit `apply` then press `start` and `ok`.

```shell
# Add identity file to the ssh agent
ssh-add {identity-file} && \
# Check if key was added
ssh-add -l
```

## Setting up server

```shell
ssh {user}@{address} -i {identity-file}
```

```shell
sudo apt update && \
sudo apt upgrade -y && \
# Update OS/distribution
sudo apt dist-upgrade && \
# This will perform a system shutdown in a proper way and then reboot the machine
shutdown -r now
```

## NGINX

```shell
# Remove server leaks
vim /etc/nginx/nginx.conf
```

```yaml
# Uncomment
server_tokens off;
```

```shell
sudo systemctl restart nginx.service
```
