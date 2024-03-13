# Home-Server

This repository contains scripts and instructions to quickly set up a home server environment.

## Installation

### Docker Installation
You can install docker [here](https://docs.docker.com/engine/install/ubuntu/).


### Docker Compose
This repo contains the following docker compose files:
- [Adguard](https://hub.docker.com/r/adguard/adguardhome)
- [Dash](https://github.com/MauriceNino/dashdot)
- [DuckDNS](https://github.com/linuxserver/docker-duckdns)
- [File Browser](https://github.com/filebrowser/filebrowser)
- [Guacamole](https://hub.docker.com/r/jwetzell/guacamole)
- [Homarr](https://ghcr.io/ajnart/homarr)
- [Jellyfin](https://github.com/linuxserver/docker-jellyfin)
- [Jellyseer](https://github.com/fallenbagel/jellyseerr)
- [Nginx Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [Portainer](https://github.com/portainer/portainer)
- [Prowlarr](https://github.com/linuxserver/docker-prowlarr)
- [qBittorrent](https://github.com/linuxserver/docker-qbittorrent)
- [Radarr](https://github.com/linuxserver/docker-radarr)
- [Sonarr](https://github.com/linuxserver/docker-sonarr)
- [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
- [Wireguard](https://docs.linuxserver.io/images/docker-wireguard/#server-mode)


1. Clone the repository
```
git clone https://github.com/dini3/Home-Server.git
cd Home-Server
```

2. Leave it as default or change the configuration (folder, ports, etc). Comment out the files you don't want to run on run-compose.sh. Remember to add token and domain to Wireguard and DuckDNS.

```
# Array of Docker Compose YAML files
compose_files=(
    "adguard.yml"
    "dash.yml"
    "duckdns.yml"
	"filebrowser.yml"
	"guacamole.yml"
	"homarr.yml"
	"jellyfin.yml"
	"jellyseer.yml"
	"npm.yml"
	"portainer.yml"
	"prowlarr.yml"
	"qbittorrent.yml"
	"radarr.yml"
	"sonarr.yml"
	"vaultwarden.yml"
	"wireguard.yml"
)
```
3. Run docker compose
```
chmod +x run-compose.sh
./run-compose.sh
```

## Default Configuration
### Ports
If ports are not changed in the yml file, the following are the ports for the web interface.

|Name|Port|
|---|---|
|AdGuard|3000(setup) /82|
|dash|84|
|File Browser|8081|
|Guacamole|8787|
|Homarr|7575|
|Jellyfin|8096|
|Jellyseer|5055|
|Nginx Proxy Manager|81|
|Portainer|9443|
|Prowlarr|9696|
|qBittorent|8080|
|Radarr|7878|
|Sonarr|8989|
|Vaultwarden|8181|

### File Layout

The default folder structure works right out of the box. Check out [TRaSH-Guides](trash-guides.info) for a better understanding.
Remember to set the proper permissions.
```
DATA
├── AppData
│   └── config
│   
├── Downloads
│   ├── radarr
│   └── tv-sonarr
│   └── torrent-blackhole
│        
└── Media
     ├── Movies
     └── TV
```
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

If you have issues with adguard regarding port 53. Port 53 is being used at your host machine, that's why you can not bind 53 to host.
```
sudo systemctl disable systemd-resolved.service
sudo systemctl stop systemd-resolved
```
To fix that, you need to edit '/etc/resolv.conf' and add the dns address. This is an example with a common dns address:
```
nameserver 8.8.8.8
```
Once pihole docker container gets running, you can change the dns server of your host to localhost, as you are binding port 53 to the host machine. Change again '/etc/resolv.conf' like this
```
nameserver 127.0.0.1
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
