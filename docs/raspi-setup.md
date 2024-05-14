# Raspi setup

## Flashing (microSD)

Download **Raspberry Pi Imager** from [raspberrypi.org](https://www.raspberrypi.org/software/).

### Config

Make sure to configure the correct network settings and enable SSH.

## Networking

The network configuration can be found in `/etc/wpa_supplicant/wpa_supplicant.conf`.

```bash
# Add more networks
# >> appends to the file
sudo wpa_passphrase "SSID" "password" >> /etc/wpa_supplicant/wpa_supplicant.conf
```

```bash
# Edit the network configuration
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
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
sudo systemctl restart wpa_supplicant.service
```
