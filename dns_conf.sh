#!/bin/bash

# Create the update-resolv-conf.sh script
cat << 'EOF' > /usr/local/bin/update-resolv-conf.sh
#!/bin/bash

# Disable and stop systemd-resolved
sudo systemctl disable systemd-resolved.service
sudo systemctl restart systemd-resolved

# Set AdGuard Home DNS server IP
ADGUARD_DNS_IP="127.0.0.1"

# Replace existing nameserver entry with AdGuard Home DNS
sudo sed -i 's/^nameserver .*/nameserver '"$ADGUARD_DNS_IP"'/' /etc/resolv.conf

# If no nameserver entry exists, add one
if ! grep -q "^nameserver" /etc/resolv.conf; then
    echo "nameserver $ADGUARD_DNS_IP" | sudo tee -a /etc/resolv.conf
fi

sudo systemctl stop systemd-resolved
EOF

# Make the script executable
sudo chmod +x /usr/local/bin/update-resolv-conf.sh

# Create the systemd service file
cat << 'EOF' | sudo tee /etc/systemd/system/update-resolv-conf.service
[Unit]
Description=Update resolv.conf with AdGuard Home DNS
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/update-resolv-conf.sh
ExecStartPre=/bin/sleep 30
User=root
EOF

# Reload systemd, enable, and start the service
sudo systemctl daemon-reload
sudo systemctl enable update-resolv-conf.service
sudo systemctl start update-resolv-conf.service

# Check the status of the service
sudo systemctl status update-resolv-conf.service
