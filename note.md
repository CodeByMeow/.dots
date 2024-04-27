
### Fix the internet wired network
Create the file /etc/systemd/network/20-wired.network

```
[Match]
Name=en*
Name=eth*

[Network]
DHCP=yes
```

Then either restart or start:
```
sudo systemctl start systemd-networkd
sudo systemctl start systemd-resolved
```
