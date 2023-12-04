#!/bin/bash

apt update
apt install -y docker.io

docker pull docksal/dns

ZONA_DB_PATH="/Projeto_FInal_Vagrant_Docker/dns/zona.db"

# Executa o contêiner DNS
docker run --name provision_dns -d \
  -e DNS_DOMAIN=docksal \
  -e DNS_IP=192.168.100.64 \
  -e LOG_QUERIES=true \
  -v $ZONA_DB_PATH:/etc/bind/zones/zona.db \
  docksal/dns
