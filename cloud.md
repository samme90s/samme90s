# Cloud

## General Information

Terraform -> Provider
Ansible -> Configurer

## WSL (Windows Subsystem for Linux) Setup

[Windows WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#file-storage)

For Visual Studio modify to add: "Linux and embedded development with C++" in order for it to work with WSL.

## SSH (Ubuntu)

[Sharing SSH Keys](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)

```shell
# Install keychain
sudo apt install keychain
```

```shell
# Copy .ssh from Windows to Linux and prevents duplicates.
# It is important to note the trailing slash, this ensures only the content of the directory is copied.
rsync -av /mnt/c/users/samme/.ssh/ ~/.ssh/
```

A worse approach:

```shell
# Copy .ssh from Windows to Linux
cp -r /mnt/c/users/samme/.ssh/ ~/.ssh/
```

```shell
# Change permissions, this is important for the ssh-agent to work!
chmod 700 ~/.ssh && chmod 600 ~/.ssh/*
```

Add to `~/.bashrc` (filenames after ssh cmd):

```shell
vim ~/.bashrc
```

```shell
# Ignore warnings if asymmetric key is missing!
# Auto start ssh agent and add keys
eval `keychain --eval --agents ssh id_ed25519 ss225ze-keypair.pem`
```

## OpenStackClient Setup (Ubuntu)

```shell
sudo apt update && sudo apt upgrade
```

```shell
sudo apt install python3-pip
```

```shell
# In order for the binary path to get set we install it as an apt package!
sudo apt install python3-openstackclient
pip install --upgrade python-openstackclient
```

## OpenStackClient Setup (Windows)

[Python Install](https://www.python.org/downloads/)

```shell
pip install python-openstackclient
```

## OpenStackClient cmd:s

Download the OpenStack RC file from the provider and extract to `~\.rc`

```shell
# Set environment variables to the current process/session.
source ~/.rc/<fn>-openrc.sh
```

```shell
# Lists all servers
openstack server list
```

```shell
# Lists all networks (see network ID:s)
openstack network list
```

```shell
# Lists the available images to create an instance/server from
openstack image list
```

```shell
# Lists the available flavors (combinations between cpu, ram and memory.. etc)
openstack flavor list
```

## Terraform Setup (Ubuntu)

[Terraform Install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```shell
# Ensure system is up to date and "gnupg", "software-properties-common" and "curl" are installed.
# These packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

```shell
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
sudo apt update && sudo apt-get install terraform
```

## Terraform Setup (Windows)

[Terraform Install](https://developer.hashicorp.com/terraform/install?product_intent=terraform)

Extract content to `C:\terraform` -> see file structure:

```text
-C:\
-|terraform\
--|LICENSE.txt
--|terraform.exe
```

```shell
# Add to PATH (using PowerShell)
# `User` can be interchanged with `Machine` or `Process`
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\terraform", "User")
```

## Terraform cmd:s

```shell
terraform <cmd> -auto-approve
```

## Ansible Setup (Ubuntu)

[Ansible Install](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip)

```shell
sudo apt update && sudo apt upgrade
```

```shell
# Verify pip is installed
python3 -m pip -V
```

```shell
# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py --user
```

If the previous step gives an error try the following:

```shell
sudo apt install python3-pip
```

```shell
# Install and upgrade Ansible
python3 -m pip install --user ansible && python3 -m pip install --upgrade --user ansible
```

## Ansible cmd:s

[Ansible Getting Started](https://docs.ansible.com/ansible/latest/getting_started/get_started_inventory.html)
