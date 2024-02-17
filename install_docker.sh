#!/bin/bash
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release
echo "Certificates installed"
mkdir -p /etc/apt/keyrings
echo "Created directory for Docker keyrings"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "Downloaded and install Docker GPG key"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Add Docker repository to APT sources"
apt-get update
echo "Update APT"
apt-get install -y docker-ce docker-ce-cli containerd.io
echo "Install Docker"
groupadd docker
usermod -aG docker $USER
echo "Add current user to the docker group"
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "Install Docker Compose"
echo "Docker installation completed."
echo "Please log out and log back in for the changes to take effect."
