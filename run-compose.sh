#!/bin/bash

# Create Directories
sudo mkdir -p /DATA/{AppData/config,Downloads/{radarr,tv-sonarr,torrent-blackhole},Media/{Movies,TV}}

# Set permissions
sudo chown -R 1000:1000 /DATA
sudo chmod -R 775 /DATA

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
 	"watchtower.yml"
)

# Loop through each Docker Compose YAML file
for file in "${compose_files[@]}"; do
    # Run docker-compose for the current file
    echo "Running Docker Compose for $file"
    docker-compose -f "$file" up -d --force-recreate
done
