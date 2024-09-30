# Raspi setup

## Flashing (microSD)

Download **Raspberry Pi Imager**
from [raspberrypi.org](https://www.raspberrypi.org/software/).

### Config

Make sure to configure the correct network settings and enable SSH.

## Raspi config

```bash
raspi-config
```

## SSH

SSH can be enabled through the raspi-config tool.

Generation of SSH key can be done with any algorithm, but ed25519 is
recommended.

```bash
ssh-keygen -t rsa -b 4096 -C "email@example.com"
```

Configuring the SSH can be done through the following file:

```bash
vim /etc/ssh/sshd_config
```

Look for `PasswordAuthentication` and set it to `no`, see below:

```yml
PasswordAuthentication no
```

**FALLBACK** -- enable password authentication for local connections by putting
this in the bottom of the file (formatting matters here):

```yml
# Allow password authentication for all local connections.
Match address 192.168.*.*
PasswordAuthentication yes
```

## Networking

### nmcli

```bash
# List all available networks
nmcli device wifi
```

```bash
# List all current and previous connections
nmcli connection show
```

```bash
# Reconnect
nmcli radio wifi off &&
nmcli radio wifi on
```

```bash
# Connect
nmcli device wifi connect {SSID} --ask

# If the network is hidden
nmcli device wifi connect {SSID} hidden yes
```

All connections are stored in seperate files (their respective name) in:

```bash
cd /etc/NetworkManager/system-connections/
```

## NGROK

Download the agent and create the configuration file as the setup guide says.

```bash
# Configuration file location:
nano /home/samme/.config/ngrok/ngrok.yml
```

```yml
# Defines all tunnels
tunnels:
  # This is the tunnel name
  ssh:
    proto: tcp
    addr: 22
```

Run the command to ensure the config is correct. This will also prepare the
service.

```bash
# Run the uninstall command if the service is already installed.
ngrok service uninstall &&
ngrok service install --config /home/samme/.config/ngrok/ngrok.yml
```

```bash
# Restart the service
systemctl restart ngrok
```
