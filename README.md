# vps-init
## What is this script?
* Automation script for v2ray-tls-ws + trojan VPS server.
* Containerized service to keep your host clean.
* TCP fast open enabled.
* Automation powered by github action.
## Prerequisite
### Install OS
ubuntu 18.04 is recommended.
### Install docker and docker compose
```bash
sudo curl -fsSL https://get.docker.com | sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
```
Logout and login again.
### Enable TCP fastopen
```
sudo su
echo "net.ipv4.tcp_fastopen=3" > /etc/sysctl.d/98-tcp-fastopen.conf
RAND=$(openssl rand -hex 16)
NEWKEY=${RAND:0:8}-${RAND:8:8}-${RAND:16:8}-${RAND:24:8}
echo "net.ipv4.tcp_fastopen_key=$NEWKEY" > /etc/sysctl.d/98-tcp_fastopen_key.conf
sysctl --system
unset RAND NEWKEY
exit
```
## Install
### Set environment variable
```bash
export DOMAIN=mydomainname.com
export V2RAY_PATH=yourV2rayPath #get one by `uuidgen`
export UUID=myUuidForV2ray #get one by `uuidgen`
export TROJAN_PASSWORD=yourTrojanPassword
```
### Install
Make sure 80, 81 and 443 port is not occupied and available to the internet.
```
git clone https://github.com/ioioioion/vps-init.git
cd vps-init
bash start.sh
```
## Automation
Check `.github/workflows/deploy.yml`