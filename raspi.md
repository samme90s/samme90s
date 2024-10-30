# Raspi

## Flashing (microSD)

Download **Raspberry Pi Imager** from [raspberrypi.org](https://www.raspberrypi.org/software/).

## Raspi config

```shell
raspi-config
```

## SSH

SSH can be enabled through the raspi-config tool.

```shell
# Configuring the SSH can be done through
vim /etc/ssh/sshd_config
```

```yaml
# Enable SSH authentication
PasswordAuthentication no
  # Fallback to allow password authentication when using local network.
  # Allow password authentication for all local connections.
Match address 192.168.*.*
PasswordAuthentication yes
```

## Networking

### nmcli

```shell
# List all available networks
nmcli device wifi
```

```shell
# List all current and previous connections
nmcli connection show
```

```shell
# Reconnect
nmcli radio wifi off &&
nmcli radio wifi on
```

```shell
# Connect
nmcli device wifi connect {SSID} --ask
# If the network is hidden
nmcli device wifi connect {SSID} hidden yes

# All connections are stored in separate files (their respective name) in:
cd /etc/NetworkManager/system-connections/
```

## NGROK

```shell
# Configuration file location:
vim /home/samme/.config/ngrok/ngrok.yml
```

```yaml
# Defines all tunnels
tunnels:
  # This is the tunnel name
  ssh:
    proto: tcp
    addr: 22
```

```shell
# Run the command to ensure the config is correct. This will also prepare the service.
# Run the uninstall command if the service is already installed.
ngrok service uninstall && \
ngrok service install --config /home/samme/.config/ngrok/ngrok.yml && \
# Restart the service
systemctl restart ngrok
```
