# General

## Rename a remote git branch:

```bash
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

## Linux

### Filesystem

```bash
# Show disk usage
df -h
```

```bash
# Show memory usage
free -h
```

```bash
# Show performance statistics
top
```

### Network

```bash
# Get public IP
curl ifconfig.me
```

```bash
# Show network interfaces
ip addr
```

```bash
# Show host network IPs
hostname -I
```
