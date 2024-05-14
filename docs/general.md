# General

## Rename a remote git branch:

```shell
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Linux

### Filesystem

```shell
# Show disk usage
df -h
```

```shell
# Show memory usage
free -h
```

```shell
# Show performance statistics
top
```

### Network

```shell
# Get public IP
curl ifconfig.me
```

```shell
# Show network interfaces
ip addr
```

```shell
# Show host network IPs
hostname -I
```
