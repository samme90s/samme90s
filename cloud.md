# Cloud

## WSL (Windows Subsystem for Linux) Setup

[Windows WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#file-storage)

For Visual Studio modify to add: "Linux and embedded development with C++" in order for it to work with WSL.

## SSH (Ubuntu)

[Sharing SSH Keys](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)

Add to `~/.bashrc` (filenames after ssh cmd):

Ignore warnings if asymmetric key is missing!

```shell
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
source ~/.rc/FILE-NAME-openrc.sh
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

## TerraForm Setup

[TerraForm Install](https://developer.hashicorp.com/terraform/install?product_intent=terraform)

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
