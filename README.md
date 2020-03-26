# vps-init
## What is this script?
* Deploy containerized server side v2ray-ws-tls stack to the VPS server in 5 mins.
* TCP fast open enabled.
* 81 port reserved for load balancer.
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
Make sure 80, 81 and 443 port is not occupied and available to the internet.
```
git clone https://github.com/ioioioion/vps-init.git
cd vps-init
bash start.sh
```
## Automation
Check `.github/workflows/deploy.yml`
