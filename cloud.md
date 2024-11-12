# Cloud

## WSL (Windows Subsystem for Linux) Setup

[Windows WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#file-storage)

For Visual Studio modify to add: "Linux and embedded development with C++" in
order for it to work with WSL.

## SSH (Ubuntu)

[Sharing SSH Keys](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)

```shell
# Install keychain
sudo apt install keychain && \
# Copy .ssh from Windows to Linux and prevents duplicates.
# It is important to note the trailing slash, this ensures only the content
# of the directory is copied.
rsync -av /mnt/c/users/samme/.ssh/ ~/.ssh/ && \
# Change permissions, this is important for the ssh-agent to work!
chmod 700 ~/.ssh && \
chmod 600 ~/.ssh/*
```

Add to `~/.bashrc` (filenames after ssh cmd):

```shell
vim ~/.bashrc
```

```text
# Add to the start of the "~/.bashrc" file
#
# Ignore warnings if asymmetric key is missing!
# Auto start ssh agent and add keys
eval `keychain --eval --agents ssh id_ed25519 ss225ze-keypair.pem`
```

## Pip

```shell
sudo apt install python3-pip
```

## OpenStackClient Setup (Ubuntu)

```shell
sudo apt update && \
sudo apt upgrade -y && \
# In order for the binary path to get set we install it as an apt package!
sudo apt install python3-openstackclient && \
pip install --upgrade python-openstackclient
```

## Terraform Setup (Ubuntu)

[Terraform Install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```shell
# Ensure system is up to date and "gnupg", "software-properties-common" and "curl" are installed.
# These packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.
sudo apt-get update && \
sudo apt-get install -y gnupg software-properties-common \
# Install HashiCorp's GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

```shell
# Verify the key's fingerprint
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```

```shell
# Add HashiCorp's official Debian repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

```shell
# Update and install Terraform
sudo apt update && \
sudo apt-get install terraform
```

## Ansible Setup (Ubuntu)

[Ansible Install](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip)

```shell
sudo apt update && \
sudo apt upgrade -y && \
# Install and upgrade Ansible
python3 -m pip install --user ansible && \
python3 -m pip install --upgrade --user ansible && \
# If ansible was not added to PATH
sudo apt install ansible
```

## Kubernetes (k8s) (Ubuntu)

```shell
cd ~ && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && \
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
kubectl version --client --output=yaml
```

## Skaffold (Ubuntu)

```shell
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
sudo install skaffold /usr/local/bin/
```

## Minikube (Ubuntu)

```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```
