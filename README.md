# Home-Server

This repository contains scripts and instructions for setting up a home server environment.

## Installation

### Docker Installation
To install Docker from the script, run the following command:
```
curl -fsSL https://raw.githubusercontent.com/dini3/Home-Server/main/install_docker.sh | bash
```

Test your installation by starting a container with the Hello World image. A message should show that your installation is working correctly.
```
docker run hello-world
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
### Screen Timeout Configuration

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
