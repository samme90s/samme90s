# Raspi setup

## Flashing (microSD)

Download **Raspberry Pi Imager** from [raspberrypi.org](https://www.raspberrypi.org/software/).

### Config

Make sure to configure the correct network settings and enable SSH.

## Raspi config

```bash
raspi-config
```

## Networking

### nmcli

```bash
# List all available networks
nlmcli device wifi
```

```bash
# List all current and previous connections
nmcli connection show
```

```bash
# Disconnect
nmcli radio wifi off
nmcli radio wifi on
```

```bash
# Connect
nmcli device wifi connect {SSID}

# If the network is hidden
nmcli device wifi connect {SSID} hidden yes
```

All connections are stored in seperate files (their respective name) in:

```bash
cd /etc/NetworkManager/system-connections/
```

The network configuration can be found in `/etc/wpa_supplicant/wpa_supplicant.conf`.

```bash
# Add more networks
# >> appends to the file
wpa_passphrase "SSID" "password" >> /etc/wpa_supplicant/wpa_supplicant.conf
```

```bash
# Edit the network configuration
nano /etc/wpa_supplicant/wpa_supplicant.conf
```

Remove the plaintext password (psk). Furthermore, add the priority to the network.

```conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="SSID"
    #psk="password"
    psk="password_hashed"
    priority=1
}
```

```bash
# Restart the network service
systemctl restart wpa_supplicant.service
```

## Remote desktop access (RDP)

Using xrdp follow this guide [linuxize.com](https://linuxize.com/post/how-to-install-xrdp-on-raspberry-pi/).

## NGROK

Download the agent and create the configuration file as the setup guide says.

```bash
# Configuration file location:
cd /home/user/.config/ngrok
```

Add endpoint to the configuration file (see [ngrok->config](https://ngrok.com/docs/agent/config/) for more options).

```yml
# Defines all tunnels
tunnels:
  # This is the tunnel name
  ssh:
    proto: tcp
    addr: 22
```

Run the command to ensure the config is correct. This will also prepare the service.

```bash
ngrok service install --config /home/user/.config/ngrok/ngrok.yml
```

### Useful links

- [ngrok->raspberry-pi](https://dashboard.ngrok.com/get-started/setup/raspberrypi)
- [ngrok->background-service](https://ngrok.com/docs/agent/#background-service)
- [ngrok->config](https://ngrok.com/docs/agent/config/)
