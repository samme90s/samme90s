# Development Environment Setup

## Git Global Configuration

```shell
git config --global user.email "email"
```

```shell
git config --global user.name "name"
```

```shell
git config --global core.editor "vim"
```

```shell
git config --global pull.rebase false
```

## Git Global Gitignore

```shell
touch ~/.gitignore_global && \
echo ".idea/" >> ~/.gitignore_global && \
# Configure Git to use the global .gitignore
git config --global core.excludesfile ~/.gitignore_global
```

```shell
# To verify the file was correctly added
git config --global --list
```

## Ubuntu

### SDKMAN

```shell
sudo apt update && \
sudo apt update && \
sudo apt install zip unzip && \
curl -s "https://get.sdkman.io" | bash && \
source "/home/samme/.sdkman/bin/sdkman-init.sh"
```

### Docker

```shell
# Set up Docker's apt repository
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

```shell
# To install the latest version, run:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

```shell
# Verify that the installation is successful by running the hello-world image:
sudo docker run hello-world
```
