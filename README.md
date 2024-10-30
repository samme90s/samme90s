# General Docs

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

## Git

### Pull contents of another repository

```shell
# Clone your new repository locally on your computer
git clone {new-repo-ssh-address}

# Navigate into its directory
cd {new-repo-dir}

# Pull contents from the other repository
git pull {old-repo-ssh-address} --allow-unrelated-histories

# Set the default global pull strategy (do this once)
git config --global pull.rebase false

# (Optional) Resolve any merge conflicts and then commit if necessary
# git add .
# git commit -m "Merged contents from {repository}"

# Push changes to your new GitLab repository
git push origin main
```
