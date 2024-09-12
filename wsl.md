# WSL (Windows Subsystem for Linux) Installation and Setup

## WSL
[Windows WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#file-storage)

For Visual Studio modify to add: "Linux and embedded development with C++" in order for it to work with WSL.

## SSH
[Sharing SSH Keys](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)


Add to `~/.bashrc` (filenames after ssh cmd):

Ignore warnings if asymmetric key is missing!

```shell
# Auto start ssh agent and add keys
eval `keychain --eval --agents ssh id_ed25519 ss225ze-keypair.pem`
```

## OpenStackClient (Ubuntu)

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
