# vps-init
## What is this script?
It will deploy containerized server side v2ray-ws-tls stack to the VPS server.
## Prerequisite
### Install docker and docker compose
```bash
sudo curl -fsSL https://get.docker.com | sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
```
Logout and login again
### Enable TCP fastopen
```
sudo su
echo "net.ipv4.tcp_fastopen=3" > /etc/sysctl.d/98-tcp-fastopen.conf
sysctl -p
exit
```
## Install
### Set environment variable
```bash
export DOMAIN=mydomainname.com
export UUID=myUuidForV2ray
```
### Install
```
bash start.sh
```
## Automation
Check `.github/workflows/deploy.yml`
