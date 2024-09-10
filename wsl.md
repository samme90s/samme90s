# WSL (Windows Subsystem for Linux) Installation and Setup

## WSL
[Windows WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#file-storage)

For Visual Studio modify to add: "Linux and embedded development with C++" in order for it to work with WSL.

## SSH
[Sharing SSH Keys](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)


Add to `~/.bashrc` (filenames after ssh cmd):

Ignore warnings if asymmetric key is missing!

```sh
# Auto start ssh agent and add keys
eval `keychain --eval --agents ssh id_ed25519 ss225ze-keypair.pem`
```