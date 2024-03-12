# Home-Server

This repository contains scripts and instructions to quickly set up a home server environment.

## Installation

### Docker Installation
You can install docker [here](https://docs.docker.com/engine/install/ubuntu/).


### Docker Compose
This docker compose file contains the following:
- Homarr
- Adguard
- DuckDNS
- WireGuard
- Nginx Proxy Manager
- Prowlarr
- qBittorent
- Sonarr
- Radarr
- Jellyfin


1. Clone the repository
```
git clone https://github.com/dini3/Home-Server.git
cd Home-Server
```

2. Change the configuration or leave it as default.

3. Run docker compose
```
sudo docker-compose up
```

If ports are not changed in the yml file, the following are the ports for the web interface.

|Name|Port|
|---|---|
|Homarr|7575|
|AdGuard|3000(setup)/82|
|Nginx Proxy Manager|81|
|Prowlarr|9696|
|qBittorent|8080 
|Sonarr|8989|
|Radarr|7878|
|Jellyfin|8096| 


## Laptop Servers

If you're running servers on laptops, it is recommended that you change these settings.

### Preventing Sleep on Lid Close

1. Open the logind configuration file:
```
sudo nano /etc/systemd/logind.conf
```
2. Change the following parameters:
```
HandleLidSwitchDocked=ignore
HandleLidSwitch=ignore
```
### Screen Timeout

To configure the screen timeout on your laptop, follow these steps:

1. Edit the GRUB configuration file:

```
sudo nano /etc/default/grub
```
2. Modify the following parameter to turn off the screen after 5 minutes:


```
GRUB_CMDLINE_LINUX="consoleblank=300"
```
3. Restart services to apply changes:

```
sudo systemctl restart systemd-logind.service && sudo update-grub
```
