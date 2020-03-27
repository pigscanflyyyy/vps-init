#!/bin/bash -ex
: ${DOMAIN:?is not given.}
: ${UUID:?is not given.}
: ${TROJAN_PASSWORD:?is not given.}
: ${V2RAY_PATH:?is not given.}
[[ -z $(nslookup $DOMAIN | grep $(curl -s http://checkip.amazonaws.com)) ]] && echo "fail to validate domain" && exit 1
envsubst '${UUID},${V2RAY_PATH}' < config.json.template > ./appdata/etc/v2ray/config.json
envsubst '${TROJAN_PASSWORD}' < trojan.config.json.template > ./appdata/config/config.json
envsubst '${DOMAIN}' < docker-compose.yml.template > docker-compose.yml
envsubst '${DOMAIN},${V2RAY_PATH}' < v2ray.subdomain.conf.template > appdata/config/nginx/proxy-confs/v2ray.subdomain.conf
docker-compose down
docker-compose pull && docker-compose up -d
echo finished!