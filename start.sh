#!/bin/bash -ex
: ${DOMAIN:?is not given.}
: ${UUID:?is not given.}
[[ -z $(nslookup $DOMAIN | grep $(curl -s http://checkip.amazonaws.com)) ]] && echo "fail to validate domain" && exit 1
envsubst '${UUID}' < config.json.template > ./appdata/etc/v2ray/config.json
envsubst '${DOMAIN}' < docker-compose.yml.template > docker-compose.yml
envsubst '${DOMAIN}' < v2ray.subdomain.conf.template > appdata/config/nginx/proxy-confs/v2ray.subdomain.conf
docker-compose down
docker-compose pull && docker-compose up -d
echo finished!