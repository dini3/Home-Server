#!/bin/bash

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

# Loop through each Docker Compose YAML file
for file in "${compose_files[@]}"; do
    # Run docker-compose for the current file
    echo "Running Docker Compose for $file"
    # docker-compose -f "$file" up -d
done
