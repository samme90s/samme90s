# Do

## About

This repository serves as a centralized hub for project documentation, essential
notes, and step-by-step guides. It provides comprehensive information and
guidance for various projects.

## Linux

### Filesystem

```shell
# Show disk usage
df -h

# Show memory usage
free -h

# Show performance statistics
top
```

### Network

```shell
# Get public IP
curl ifconfig.me

# Show network interfaces
ip addr

# Show host network IPs
hostname -I
```

## SSH

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
