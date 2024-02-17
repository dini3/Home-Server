#!/bin/bash

# Install prerequisites
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Create directory for Docker keyrings
sudo mkdir -p /etc/apt/keyrings

# Download and install Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update APT
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add current user to the docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Docker Compose
sudo apt-get install docker-compose-plugin

echo "Docker installation completed."
echo "Please log out and log back in for the changes to take effect."
